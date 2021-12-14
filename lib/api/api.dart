import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sic_ui/api/api_error.dart';
import 'package:sic_ui/models/server_state.dart';
import 'package:sic_ui/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Api {
  static final Api _api = Api._internal();
  static WebSocketChannel? _ws;
  static Dio dio = Dio(BaseOptions(
      contentType: 'application/json',
      responseType: ResponseType.json,
      connectTimeout: 5000,
      receiveTimeout: 5000));

  factory Api() {
    return _api;
  }

  Api._internal();

  // REST API
  Future<Either<ApiError, dynamic>> request(String method, String url,
      {Map<String, dynamic>? params, data, String baseUrl = apiUrl}) async {
    Response response;
    try {
      response = await dio.request(baseUrl + url,
          queryParameters: params,
          data: data,
          options: Options(method: method));
    } on OSError {
      return Left(ApiError.networkError());
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.response:
          return Left(e.response!.data.runtimeType != String
              ? ApiError(e.response!.data)
              : ApiError.networkError());
        case DioErrorType.cancel:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
        default:
          return Left(ApiError.networkError());
      }
    }

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Right(response.data);
    }

    return Left(ApiError.unknownError());
  }

  Future<Either<ApiError, dynamic>> get(String url,
      {Map<String, dynamic>? params, String baseUrl = apiUrl}) async {
    return await request('GET', url, params: params, baseUrl: baseUrl);
  }

  Future<Either<ApiError, dynamic>> post(String url, data) async {
    return await request('POST', url, data: data);
  }

  Future<Either<ApiError, dynamic>> put(String url, data) async {
    return await request('PUT', url, data: data);
  }

  Future<Either<ApiError, dynamic>> delete(String url, {data}) async {
    return await request('DELETE', url, data: data);
  }

  // WEBSOCKETS
  void connect(BuildContext context) async {
    _ws = WebSocketChannel.connect(Uri.parse(apiSocket));

    _ws!.stream.listen((message) => _onMessage(message, context),
        onError: (error) {
      print('[API] Websocket error $error. Show dialog for restarting app.');

      ServerState state = Provider.of<ServerState>(context, listen: false);
      state.markReconnecting(false);
      state.markNeedsRestart();

      reconnect(context);
    }, onDone: () {
      print('[API] Websocket finished. Show dialog for restarting app.');

      ServerState state = Provider.of<ServerState>(context, listen: false);
      state.markReconnecting(false);
      state.markNeedsRestart();

      reconnect(context);
    });
  }

  void reconnect(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));

    ServerState state = Provider.of<ServerState>(context, listen: false);

    if (state.reconnecting) return;

    state.markReconnecting(true);
    connect(context);
  }

  bool connected() {
    return _ws != null && _ws!.closeCode != null;
  }

  void closeConnection() {
    if (_ws != null) {
      _ws!.sink.close();
      _ws = null;
    }
  }

  void _onMessage(String message, BuildContext context) {
    ServerState state = Provider.of<ServerState>(context, listen: false);
    Map<String, dynamic>? data = jsonDecode(message);
    state.markReconnected();
    state.update(data);
  }

  void _sendMessage(String message) {
    _ws!.sink.add(message);
  }
}
