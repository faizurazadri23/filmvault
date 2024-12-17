import 'package:filmvault/component/atom/atom.dart';
import 'package:filmvault/component/molecules/custom_appbar.dart';
import 'package:filmvault/component/section/movie_section.dart';
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
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(padding: CustomPaddings.padding12_12_12_12(context),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSection.titleMenu(context, title: 'Trending saat ini'),
            SizedBox(height: CustomSizes.hp4(context),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(10, (index) {
                  return MovieSection.itemMovie(context, url: 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2023/11/8/af3ff20c-18c0-4341-95e4-03481b537bdb.jpg', onTap: () {

                  },);
                },),
              ),
            ),
            SizedBox(height: CustomSizes.hp4(context),),
            MovieSection.titleMenu(context, title: 'Segera hadir'),
            SizedBox(height: CustomSizes.hp4(context),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(10, (index) {
                  return MovieSection.itemMovie(context, url: 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2023/11/8/af3ff20c-18c0-4341-95e4-03481b537bdb.jpg', onTap: () {

                  },);
                },),
              ),
            ),
            SizedBox(height: CustomSizes.hp4(context),),
            MovieSection.titleMenu(context, title: 'Saat ini tayang'),
            SizedBox(height: CustomSizes.hp4(context),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(10, (index) {
                  return MovieSection.itemMovie(context, url: 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2023/11/8/af3ff20c-18c0-4341-95e4-03481b537bdb.jpg', onTap: () {

                  },);
                },),
              ),
            ),
            SizedBox(height: CustomSizes.hp4(context),),
            MovieSection.titleMenu(context, title: 'Film terpopuler'),
            SizedBox(height: CustomSizes.hp4(context),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(10, (index) {
                  return MovieSection.itemMovie(context, url: 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2023/11/8/af3ff20c-18c0-4341-95e4-03481b537bdb.jpg', onTap: () {

                  },);
                },),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
