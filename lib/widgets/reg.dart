import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reg extends StatelessWidget {
  final String name;
  final int? value;

  const Reg(this.name, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Container(
      width: 40,
      height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: GoogleFonts.robotoMono(fontSize: 18),),
          Text(value != null ? value!.toRadixString(16).padLeft(2, '0').toUpperCase() : '??', style: GoogleFonts.robotoMono(fontSize: 22))
        ],
      ),
    ),);
  }
}
