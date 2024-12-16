import 'package:filmvault/component/atom/atom.dart';
import 'package:flutter/material.dart';

import '../../config/navigation.dart';

class CustomAppbar{
  static build({
    required BuildContext context,
    String title = "Apps",
    IconData iconBack = Icons.keyboard_arrow_left_outlined,
    Color color = Colors.black,
    Color colorIcon = Colors.black,
    Color backgroundColor = Colors.white,
    Color colorShadow = Colors.grey,
    Alignment align = Alignment.center,
    bool leading = false,
    bool pop = false,
    double textSize = 16,
    bool back = false,
    required Function() onTap,
    bool centerTitle = true,
  }) {
    return AppBar(
      title: CustomText.textBold(
          context: context,
          text: title,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textColor: color,
          size: CustomSizes.dp16(context)),

      centerTitle: centerTitle,
      // automaticallyImplyLeading: false,
      leading: leading==false ? null : IconButton(
        icon: Icon(
          iconBack,
          color: colorIcon,
          size: CustomSizes.dp25(context),
        ),
        onPressed: back
            ? onTap
            : () {
          Navigation.instance.goBack();
        },
      ),
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      shadowColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}