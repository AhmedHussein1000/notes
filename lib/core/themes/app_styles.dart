import 'package:flutter/material.dart';

abstract class Styles {  
  static TextStyle styleRegular16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleRegular18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w400,
      );



  

  static TextStyle styleSemiBold20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleBold24(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w700,
      );
    static TextStyle styleRegular26(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 26),
        fontWeight: FontWeight.w400,
      );


 

  



}
//scale factor
// responsive font size
// min max

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width / 412;
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSize = fontSize * getScaleFactor(context);
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
