import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class EmptyList extends GetView {
  final String? name;

  EmptyList({this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      name ?? "No Data",
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          color: HexColor('#262626'),
          fontWeight: FontWeight.w500,
          fontSize: 30),
    ));
  }
}
