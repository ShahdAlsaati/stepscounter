import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
   String? text;
   double? fontSize;
   TextWidget(this.text,this.fontSize);
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: fontSize!,
        fontWeight:FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }
}
