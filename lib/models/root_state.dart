import 'package:equatable/equatable.dart';
import 'package:sic_ui/models/regs.dart';

class RootState extends Equatable {
  Regs? _regs;
  List<String>? _mem;

  RootState(Map<String, dynamic>? data) {
    // DateTime start = DateTime.now();
    if (data == null) return; // empty constructor

    _regs = Regs(data['regs']);
    _mem = List<String>.from(data['mem']);
  }

  @override
  List<Object?> get props => [
        _regs,
        _mem,
      ];

  Regs? get regs => _regs;
  List<String>? get mem => _mem;
}
