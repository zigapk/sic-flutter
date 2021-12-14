import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sic_ui/home.dart';
import 'package:sic_ui/models/server_state.dart';
import 'package:provider/provider.dart';

import 'api/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ServerState>(create: (_) => ServerState()),
  ], child: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    Api().connect(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      }),
      home: const Home(),
    );
  }
}
