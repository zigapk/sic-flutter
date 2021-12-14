import 'package:equatable/equatable.dart';

class Regs extends Equatable {
  int? _a;
  int? _x;
  int? _l;
  int? _b;
  int? _s;
  int? _t;
  int? _f;
  int? _pc;
  int? _sw;

  Regs(Map<String, dynamic>? data) {
    if (data == null) return;

    _a = data['a'];
    _x = data['x'];
    _l = data['l'];
    _b = data['b'];
    _s = data['s'];
    _t = data['t'];
    _f = data['f'];
    _pc = data['pc'];
    _sw = data['sw'];
  }

  @override
  List<Object?> get props => [
    _x,
    _l,
    _b,
    _s,
    _t,
    _f,
    _pc,
    _sw,
  ];

  int? get a => _a;
  int? get x => _x;
  int? get l => _l;
  int? get b => _b;
  int? get s => _s;
  int? get t => _t;
  int? get f => _f;
  int? get pc => _pc;
  int? get sw => _sw;

}