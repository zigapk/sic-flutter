import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sic_ui/models/regs.dart';
import 'package:sic_ui/models/server_state.dart';
import 'package:sic_ui/widgets/reg.dart';

class RegsWidget extends StatelessWidget {
  const RegsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Regs? regs = ServerState.of(context).rootState.regs;
    var width = MediaQuery.of(context).size.width;

    if (width > 800) {
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
            ],
          ),
          Container(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Reg('S', regs?.s),
              Reg('T', regs?.t),
              Reg('F', regs?.f),
              Reg('PC', regs?.pc),
              Reg('SW', regs?.sw),
            ],
          ),
        ],
      );
    } else if (width > 400) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Reg('A', regs?.a),
              Reg('X', regs?.x),
            ],
          ),
          Container(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Reg('L', regs?.l),
              Reg('B', regs?.b),
            ],
          ),
          Container(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Reg('S', regs?.s),
              Reg('T', regs?.t),
            ],
          ),
          Container(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Reg('F', regs?.f),
              Reg('PC', regs?.pc),
            ],
          ),
          Reg('SW', regs?.sw),
        ],
      );
    } else {
      return Column(
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
    }
  }
}
