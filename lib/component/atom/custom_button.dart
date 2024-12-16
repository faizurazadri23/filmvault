import 'package:filmvault/component/atom/atom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton{

  static buttonGradient(
      BuildContext context, {
        required Color gradient1,
        required Color gradient2,
        required String text,
        Color textColor = Colors.black,
        double textSize = 12,
        bool status = false,
      }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          status ? CustomSizes.dp20(context) : CustomSizes.dp10(context),
        ),
        gradient: LinearGradient(
          colors: [
            gradient1,
            gradient2,
          ],
        ),
      ),
      child: Padding(
        padding: status
            ? CustomPaddings.padding12_4_12_4(context)
            : CustomPaddings.padding12_12_12_12(context),
        child: Center(
            child: CustomText.textBold(
              context: context,
              text: text,
              textColor: textColor,
              size: textSize,
            )),
      ),
    );
  }
}