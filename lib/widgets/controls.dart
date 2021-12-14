import 'package:flutter/material.dart';
import 'package:sic_ui/api/api.dart';
import 'package:sic_ui/models/root_state.dart';
import 'package:sic_ui/models/server_state.dart';

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    RootState? rootState = ServerState.of(context).rootState;

    if (rootState.regs == null) {
      return Container();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flex(
          direction: width > 600 ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed:
                    rootState.running == null || rootState.running! == true
                        ? null
                        : () => Api().request('GET', '/start'),
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
                onPressed:
                    rootState.running == null || rootState.running! == true
                        ? () => Api().request('GET', '/stop')
                        : null,
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
                onPressed:
                    rootState.running == null || rootState.running! == true
                        ? null
                        : () => Api().request('GET', '/step'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Text(
                    'STEP',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
          ],
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Slider(
            label: '${rootState.interval!} ms',
            value:
                rootState.interval == null ? 0 : rootState.interval!.toDouble(),
            onChanged: rootState.running == null || rootState.running! == true
                ? null
                : (v) {
                    Api().post('set_interval', {'interval': v.round()});
                  },
            min: 50,
            max: 1000,
            divisions: 20,
          ),
        )
      ],
    );
  }
}
