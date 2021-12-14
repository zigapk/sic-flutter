import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sic_ui/models/regs.dart';
import 'package:sic_ui/models/root_state.dart';
import 'package:provider/provider.dart';

class ServerState extends ChangeNotifier {
  // is restart of whole app needed
  bool _needsRestart = false;
  bool _reconnecting = false;
  RootState _rootState = RootState(null);

  ServerState();

  void update(Map<String, dynamic>? data) {
    _rootState = RootState(data!['objects']);
    notifyListeners();
  }

  bool get needsRestart => _needsRestart;

  bool get reconnecting => _reconnecting;

  RootState get rootState => _rootState;

  void markNeedsRestart() {
    _needsRestart = true;
    notifyListeners();
  }

  void markReconnected() {
    _needsRestart = false;
    _reconnecting = false;
    notifyListeners();
  }

  void markReconnecting(bool value) {
    _reconnecting = value;
    notifyListeners();
  }

  static ServerState of(BuildContext context, {listen: true}) {
    return Provider.of<ServerState>(context, listen: listen);
  }

  static RootState rootStateOf(BuildContext context) {
    return context
        .select<ServerState, RootState>((serverState) => serverState.rootState);
  }
}