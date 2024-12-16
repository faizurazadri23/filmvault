import 'package:filmvault/component/atom/atom.dart';
import 'package:flutter/cupertino.dart';

class CustomPaddings{
  static padding10_10_10_10(BuildContext context){
    return EdgeInsets.only(
      top: CustomSizes.dp10(context),
      left: CustomSizes.dp10(context),
      bottom: CustomSizes.dp10(context),
      right: CustomSizes.dp10(context),
    );
  }

  static padding16_16_16_0(BuildContext context){
    return EdgeInsets.only(
      left: CustomSizes.dp16(context),
      right: CustomSizes.dp16(context),
      top: CustomSizes.dp16(context),
    );
  }

  static padding16_0_16_0(BuildContext context){
    return EdgeInsets.only(
      left: CustomSizes.dp16(context),
      right: CustomSizes.dp16(context),
    );
  }

  static padding16_16_16_16(BuildContext context){
    return EdgeInsets.only(
      top: CustomSizes.dp16(context),
      left: CustomSizes.dp16(context),
      bottom: CustomSizes.dp16(context),
      right: CustomSizes.dp16(context),
    );
  }

  static padding20_0_20_0(BuildContext context){
    return EdgeInsets.only(
      left: CustomSizes.dp20(context),
      right: CustomSizes.dp20(context),
    );
  }

  static padding12_4_12_4(BuildContext context){
    return EdgeInsets.only(
      left: CustomSizes.dp12(context),
      top: CustomSizes.dp4(context),
      right: CustomSizes.dp12(context),
      bottom: CustomSizes.dp4(context),
    );
  }

  static padding12_12_12_12(BuildContext context){
    return EdgeInsets.only(
      top: CustomSizes.dp12(context),
      bottom: CustomSizes.dp12(context),
      left: CustomSizes.dp12(context),
      right: CustomSizes.dp12(context),

    );
  }

  static padding16_12_16_12(BuildContext context){
    return EdgeInsets.only(
      left: CustomSizes.dp16(context),
      top: CustomSizes.dp12(context),
      right: CustomSizes.dp16(context),
      bottom: CustomSizes.dp12(context),
    );
  }
}