import 'package:filmvault/component/atom/atom.dart';
import 'package:filmvault/component/molecules/custom_appbar.dart';
import 'package:filmvault/config/constants/app_strings.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _StateDashboardPage();
}

class _StateDashboardPage extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar.build(
        context: context,
        title: AppStrings.appName,
        leading: false,
        onTap: () {},
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(padding: CustomPaddings.padding12_12_12_12(context),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.textBold14(context: context, text: 'Trending saat ini')
          ],
        ),),
      ),
    );
  }
}
