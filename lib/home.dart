import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sic_ui/models/root_state.dart';
import 'package:sic_ui/models/server_state.dart';
import 'package:sic_ui/widgets/controls.dart';
import 'package:sic_ui/widgets/mem_widget.dart';
import 'package:sic_ui/widgets/regs_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServerState serverState = ServerState.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SIC/XE'),
      ),
      body: Center(
        child: serverState.needsRestart || serverState.reconnecting
            ? Text(
                'Not connected.',
                style: GoogleFonts.robotoMono(fontSize: 24),
              )
            : SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const RegsWidget(),
                        Container(
                          height: 16,
                        ),
                        const Controls(),
                        Container(
                          height: 16,
                        ),
                        const MemWidget(),
                      ],
                    )),
              ),
      ),
    );
  }
}
