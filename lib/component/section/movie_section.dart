import 'package:filmvault/component/atom/atom.dart';
import 'package:flutter/material.dart';

class MovieSection {
  static Widget itemMovie(BuildContext context,
      {required String url, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(CustomSizes.dp10(context)))),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
