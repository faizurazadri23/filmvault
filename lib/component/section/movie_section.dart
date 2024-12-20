import 'package:filmvault/component/atom/atom.dart';
import 'package:filmvault/component/molecules/molecules.dart';
import 'package:flutter/material.dart';

class MovieSection {
  static Widget itemMovie(BuildContext context,
      {required String url, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: CustomSizes.dp4(context)),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
              Radius.circular(CustomSizes.dp5(context))),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: CustomSizes.hp30(context) * 2,
            height: CustomSizes.hp30(context) * 3,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return itemLoadingMovie(context);
              }
            },
          ),
        ),
      ),
    );
  }
  
  static Widget itemLoadingMovie(BuildContext context){
    return ShimmerLoading(isLoading: true, child: Container(
      margin: EdgeInsets.symmetric(horizontal: CustomSizes.dp4(context)),
      width: CustomSizes.hp30(context) * 2,
      height: CustomSizes.hp30(context) * 3,
      color: Colors.grey,
    ));
  }

  static Widget loadingConditionMovie(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(10, (index) {
        return itemLoadingMovie(context);
      },),
    );
  }

  static Widget titleMenu(BuildContext context, {required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: CustomText.textBold14(context: context, text: title),),
        Icon(Icons.arrow_forward, size: CustomSizes.dp15(context),)
      ],
    );
  }
}
