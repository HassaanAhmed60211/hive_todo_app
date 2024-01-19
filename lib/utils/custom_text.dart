import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTextWidget({
  // bool softwrap = false,
  required text,
  double fontSize = 14.0,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.w600,
  TextOverflow overflow = TextOverflow.visible,
  double lineHeight = 1.2,
  TextAlign textAlign = TextAlign.start,
  double? letterSpacing,
  int? maxLines,
  fixText = false,
  isRaleway = true,
  TextDecoration? txtDecoration,
}) {
  return fixText
      ? AutoSizeText(text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: isRaleway
              ? GoogleFonts.openSans(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: lineHeight,
                  textStyle: TextStyle(
                    decoration: txtDecoration ?? TextDecoration.none,
                    overflow: overflow,
                  ))
              : GoogleFonts.openSans(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: lineHeight,
                  textStyle: TextStyle(
                    decoration: txtDecoration ?? TextDecoration.none,
                    overflow: overflow,
                  )))
      : Text(text,
          // softWrap: softwrap,
          textAlign: textAlign,
          style: isRaleway
              ? GoogleFonts.raleway(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: lineHeight,
                  textStyle: TextStyle(
                    decoration: txtDecoration ?? TextDecoration.none,
                    overflow: overflow,
                  ))
              : GoogleFonts.poppins(
                  letterSpacing: letterSpacing,
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: lineHeight,
                  textStyle: TextStyle(
                    decoration: txtDecoration ?? TextDecoration.none,
                    overflow: overflow,
                  )));
}
