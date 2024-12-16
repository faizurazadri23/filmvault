import 'package:filmvault/component/atom/atom.dart';
import 'package:flutter/material.dart';

class CustomText {
  static textBold({
    required BuildContext context,
    required String text,
    textAlign = TextAlign.left,
    Color textColor = Colors.black,
    double size = 0,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 5,
  }) {
    double setSizes;
    if (size == 0) {
      setSizes = CustomSizes.dp16(context);
    } else {
      setSizes = size;
    }
    return setText(
        context: context,
        text: text,
        sizes: setSizes,
        textAlign: textAlign,
        textColor: textColor,
        overflow: overflow,
        maxLines: maxLines);
  }

  //regular

  static textRegular({
    required BuildContext context,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color textColor = Colors.black,
    double size = 0,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 5,
  }) {
    double setSizes;
    if (size == 0) {
      setSizes = CustomSizes.dp12(context);
    } else {
      setSizes = size;
    }
    return setText(
        context: context,
        text: text,
        sizes: setSizes,
        textAlign: textAlign,
        textColor: textColor,
        overflow: overflow,
        maxLines: maxLines);
  }

  static textRegular10({
    required BuildContext context,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color textColor = Colors.black,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 5,
  }) {
    return setText(
        context: context,
        text: text,
        sizes: CustomSizes.dp10(context),
        textAlign: textAlign,
        textColor: textColor,
        overflow: overflow,
        maxLines: maxLines);
  }

  static textMedium({
    required BuildContext context,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color textColor = CustomColors.font,
    TextOverflow overflow = TextOverflow.fade,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 5,
    double size = 0,
  }) {

    double setSizes;
    if (size == 0) {
      setSizes = CustomSizes.dp12(context);
    } else {
      setSizes = size;
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      // softWrap: false,
      maxLines: maxLines,
      style: TextStyle(
          color: textColor,
          fontSize: setSizes,
          fontStyle: fontStyle),
    );
  }

  static textMedium14({
    required BuildContext context,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color textColor = CustomColors.font,
    TextOverflow overflow = TextOverflow.fade,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 5,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      // softWrap: false,
      maxLines: maxLines,
      style: TextStyle(
          color: textColor,
          fontSize: CustomSizes.dp14(context),
          fontStyle: fontStyle),
    );
  }

  static textRegular8({
    required BuildContext context,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color textColor = Colors.black,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 5,
  }) {
    return setText(
        context: context,
        text: text,
        sizes: CustomSizes.dp8(context),
        textAlign: textAlign,
        textColor: textColor,
        overflow: overflow,
        maxLines: maxLines);
  }

  //bold

  static textBold14({
    required BuildContext context,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color textColor = Colors.black,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 5,
  }) {
    return setTextBold(
        context: context,
        text: text,
        sizes: CustomSizes.dp14(context),
        textAlign: textAlign,
        textColor: textColor,
        overflow: overflow,
        maxLines: maxLines);
  }

  static setText({
    required BuildContext context,
    required String text,
    required double sizes,
    required TextAlign textAlign,
    required Color textColor,
    required TextOverflow overflow,
    required int maxLines,
  }) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLines,
        style: TextStyle(
            color: textColor, fontSize: sizes, fontWeight: FontWeight.normal));
  }

  static setTextBold({
    required BuildContext context,
    required String text,
    required double sizes,
    required TextAlign textAlign,
    required Color textColor,
    required TextOverflow overflow,
    required int maxLines,
  }) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontSize: sizes, fontWeight: FontWeight.bold),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }

  static textBold12({
    required BuildContext context,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color textColor = CustomColors.font,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 5,
  }) {
    return setTextBold(
        context: context,
        text: text,
        sizes: CustomSizes.dp12(context),
        textAlign: textAlign,
        textColor: textColor,
        overflow: overflow,
        maxLines: maxLines);
  }
}
