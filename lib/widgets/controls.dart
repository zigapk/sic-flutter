import 'package:flutter/material.dart';
import 'package:sic_ui/api/api.dart';
import 'package:sic_ui/models/regs.dart';
import 'package:sic_ui/models/server_state.dart';

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Flex(
      direction: width > 600 ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () => print('TODO'),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                'START',
                style: TextStyle(fontSize: 18),
              ),
            )),
        Container(
          width: 16,
        ),
        TextButton(
            onPressed: () => print('TODO'),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                'STOP',
                style: TextStyle(fontSize: 18),
              ),
            )),
        Container(
          width: 16,
        ),
        TextButton(
            onPressed: () => Api().request('GET', '/step'),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                'STEP',
                style: TextStyle(fontSize: 18),
              ),
            )),
        Container(
          width: 16,
        ),
        TextButton(
            onPressed: () => print('TODO'),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                'STEP OVER',
                style: TextStyle(fontSize: 18),
              ),
            )),
      ],
    );
  }
}
