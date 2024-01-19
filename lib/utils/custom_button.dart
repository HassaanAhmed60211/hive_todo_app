import 'package:flutter/material.dart';

// import 'color_utils.dart';
// import 'spaces.dart';

Widget customElevatedBtnWidget(
    {context,
    required Widget child,
    required func,
    double? height = 47,
    Color bgColor = Colors.white,
    Color? borderColor,
    double? width,
    double circlularBorderRadius = 10}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
          // surfaceTintColor: ColorConstants.primaryColor,
          // splashFactory: ,
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circlularBorderRadius),
          ),
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(color: borderColor)),
      child: child,
    ),
  );
}
