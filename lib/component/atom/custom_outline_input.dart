import 'package:filmvault/component/atom/atom.dart';
import 'package:flutter/material.dart';

class CustomOutlineInput {
  static enableBorder(BuildContext buildContext) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.ptrBlueGray.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(
        CustomSizes.dp8(buildContext),
      ),
    );
  }

  static focusedBorder(BuildContext buildContext) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.ptrBlueGray.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(
        CustomSizes.dp8(buildContext),
      ),
    );
  }

  static focusedErrorBorder(BuildContext buildContext) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.red2[0].withOpacity(0.2),
      ),
      borderRadius: BorderRadius.circular(
        CustomSizes.dp8(buildContext),
      ),
    );
  }

  static errorBorder(BuildContext buildContext) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.red2[0].withOpacity(0.2),
      ),
      borderRadius: BorderRadius.circular(
        CustomSizes.dp8(buildContext),
      ),
    );
  }

  static enableBorderCustom(BuildContext buildContext,
      {required Color borderColor}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(
        CustomSizes.dp8(buildContext),
      ),
    );
  }

  static focusedBorderCustom(BuildContext buildContext,
      {required Color borderColor}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(
        CustomSizes.dp8(buildContext),
      ),
    );
  }
}
