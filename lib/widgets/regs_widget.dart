import 'package:flutter/material.dart';
import 'package:sic_ui/models/regs.dart';
import 'package:sic_ui/models/server_state.dart';
import 'package:sic_ui/widgets/reg.dart';

class RegsWidget extends StatelessWidget {
  const RegsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Regs? regs = ServerState.of(context).rootState.regs;
    var width = MediaQuery.of(context).size.width;
    var singleRow = width > 600;

    if (singleRow) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Reg('A', regs?.a),
          Reg('X', regs?.x),
          Reg('L', regs?.l),
          Reg('B', regs?.b),
          Reg('S', regs?.s),
          Reg('T', regs?.t),
          Reg('F', regs?.f),
          Reg('PC', regs?.pc),
          Reg('SW', regs?.sw),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Reg('A', regs?.a),
              Reg('X', regs?.x),
              Reg('L', regs?.l),
              Reg('B', regs?.b),
              Reg('S', regs?.s),
            ],
          ),
          Container(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Reg('T', regs?.t),
              Reg('F', regs?.f),
              Reg('PC', regs?.pc),
              Reg('SW', regs?.sw),
            ],
          )
        ],
      );
    }
  }
}
