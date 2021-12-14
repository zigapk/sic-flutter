import 'package:flutter/material.dart';

@immutable
class ApiError {
  final String code;

  const ApiError(Map<String, dynamic>? data) : code = 'unknown_error';

  const ApiError.networkError() : code = 'network_error';

  const ApiError.unknownError() : code = 'unknown_error';

  @override
  String toString() {
    return 'ApiError: code $code';
  }
}