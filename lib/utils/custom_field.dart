import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final ValueChanged<String>? onChanged;
  final bool isReadOnly;
  final Color colorBorder;
  final TextEditingController controller;
  final String suffixText;
  final double fontSize;
  final double controllerfontSize;
  final double suffixfontSize;
  final Color suffixColor;
  final FontWeight fontWeight;
  final double height;
  final String hintText;
  final double circularRadius;
  final bool isPassword;
  final TextInputType keyBoard;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final double? withOpacity;
  final Color? color;

  const CustomTextField({
    super.key,
    this.currentFocusNode,
    this.onChanged,
    this.isReadOnly = false,
    this.colorBorder = Colors.grey,
    required this.controller,
    this.suffixText = '',
    this.fontSize = 14,
    this.controllerfontSize = 14,
    this.suffixfontSize = 14,
    this.suffixColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.height = 58,
    this.hintText = "",
    this.circularRadius = 14,
    this.isPassword = false,
    this.keyBoard = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.withOpacity,
    this.color = const Color(0xFFF6F6F8),
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circularRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onChanged: onChanged,
        focusNode: currentFocusNode,
        textAlign: TextAlign.left,
        readOnly: isReadOnly,
        obscureText: isPassword,
        onSubmitted: (String onCompleted) {
          // changeFocusScope();
          try {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } catch (e) {
            log("This can't be focused into the next keyboard.");
          }
        },
        controller: controller,
        keyboardType: keyBoard,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: controllerfontSize,
          fontWeight: fontWeight,
          fontFamily: GoogleFonts.openSans().fontFamily,
          color: const Color(0xFF2B2B2B),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixText: suffixText,
          contentPadding: (prefixIcon != null || suffixIcon != null)
              ? const EdgeInsets.only(top: 15)
              : const EdgeInsets.only(left: 5, top: 5),
          suffixStyle: TextStyle(
            fontSize: suffixfontSize,
            fontWeight: fontWeight,
            color: suffixColor,
          ),
          hintStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6A6A6A).withOpacity(
              withOpacity ?? 0.6,
            ),
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
