import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sic_ui/models/root_state.dart';
import 'package:sic_ui/models/server_state.dart';

class MemWidget extends StatelessWidget {
  const MemWidget({Key? key}) : super(key: key);

  String getAsciiHelper(String hexValue) {
    var intValue = int.parse(hexValue, radix: 16);

    if (intValue < 32 || intValue > 127) {
      return '';
    } else {
      return ' (ASCII `${String.fromCharCode(intValue)}`)';
    }
  }

  @override
  Widget build(BuildContext context) {
    RootState? rootState = ServerState.of(context).rootState;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(32),
      constraints: const BoxConstraints(maxWidth: 800),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: width > 700 ? 30 : (width > 350 ? 15 : 10),
        children: rootState.mem == null
            ? []
            : rootState.mem!
                .asMap()
                .entries
                .map(
                  (e) => Tooltip(
                    message:
                        'Address: ${e.key.toRadixString(16).padLeft(6, '0').toUpperCase()}${getAsciiHelper(e.value)}',
                    child: Container(
                        decoration: BoxDecoration(
                          color: rootState.regs!.pc == e.key
                              ? Colors.grey.shade400
                              : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Center(
                          child: Text(
                            e.value,
                            style: GoogleFonts.robotoMono(),
                          ),
                        )),
                  ),
                )
                .toList(),
      ),
    );
  }
}
