import 'package:filmvault/component/atom/atom.dart';
import 'package:filmvault/config/navigation.dart';
import 'package:filmvault/config/routes.dart';
import 'package:flutter/material.dart';

import '../config/constants/app_strings.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});


  @override
  State<SplashPage> createState() => _StateSplash();
}

class _StateSplash extends State<SplashPage>{

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      Navigation.instance.navigateAndReplaceAll(Routes.login);
    },);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CustomText.textMedium14(context: context, text: AppStrings.appName),
      ),
    );
  }
}