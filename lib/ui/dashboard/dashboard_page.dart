import 'package:filmvault/blocs/now_movie_playing/now_movie_playing_event.dart';
import 'package:filmvault/blocs/now_movie_playing/now_movie_playing_state.dart';
import 'package:filmvault/component/atom/atom.dart';
import 'package:filmvault/component/molecules/molecules.dart';
import 'package:filmvault/component/section/movie_section.dart';
import 'package:filmvault/config/constants/app_strings.dart';
import 'package:filmvault/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/now_movie_playing/now_movie_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _StateDashboardPage();
}

class _StateDashboardPage extends State<DashboardPage> {

  final List<String> images = [
    'https://images.tokopedia.net/img/cache/700/hDjmkQ/2023/11/8/af3ff20c-18c0-4341-95e4-03481b537bdb.jpg',
    'https://via.placeholder.com/350x150/FF0000/FFFFFF',
    'https://via.placeholder.com/350x150/00FF00/FFFFFF',
    'https://via.placeholder.com/350x150/0000FF/FFFFFF',
  ];

  final _nowMoviePlayingBloc = inject<NowMoviePlayingBloc>();
  final _page = 1;

  @override
  void initState(){
    _nowMoviePlayingBloc.add(NowMoviePlayingGet(_page));
    super.initState();
  }

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
            SizedBox(
                height: CustomSizes.hp20(context) * 5, // Tinggi slider
                child: BlocBuilder(
                  bloc: _nowMoviePlayingBloc,
                  builder: (context, state) {
                  if(state is NowMovieLoadingPlaying){
                    return ShimmerLoading(
                      isLoading: true,
                      child: Container(
                        height: CustomSizes.hp20(context) * 5,
                        width: CustomSizes.width(context),
                        color: Colors.grey,
                      ),
                    );
                  }else if(state is NowMovieSuccessPlaying){
                    return PageView.builder(
                      itemCount: state.nowMovieResult.results.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            "${AppStrings.urlImagePath}${state.nowMovieResult.results[index].backdropPath}",
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if(loadingProgress==null){
                                return child;
                              }else{
                                return ShimmerLoading(
                                  isLoading: true,
                                  child: Container(
                                    height: CustomSizes.hp20(context) * 5,
                                    width: CustomSizes.width(context),
                                    color: Colors.grey,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },)),
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
