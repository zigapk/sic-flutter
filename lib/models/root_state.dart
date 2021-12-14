import 'package:equatable/equatable.dart';
import 'package:sic_ui/models/regs.dart';

class RootState extends Equatable {
  Regs? _regs;
  List<String>? _mem;
  bool? _running;
  int? _interval;

  RootState(Map<String, dynamic>? data) {
    // DateTime start = DateTime.now();
    if (data == null) return; // empty constructor

    _regs = Regs(data['regs']);
    _mem = List<String>.from(data['mem']);
    _running = data['running'];
    _interval = data['interval'];
  }

  @override
  List<Object?> get props => [_regs, _mem, _running, _interval];

  Regs? get regs => _regs;
  List<String>? get mem => _mem;
  bool? get running => _running;
  int? get interval => _interval;
}
