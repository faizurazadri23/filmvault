import 'package:filmvault/blocs/movie_trending/movie_trending_bloc.dart';
import 'package:filmvault/blocs/movie_trending/movie_trending_event.dart';
import 'package:filmvault/blocs/movie_trending/movie_trending_state.dart';
import 'package:filmvault/blocs/now_movie_playing/now_movie_playing_event.dart';
import 'package:filmvault/blocs/now_movie_playing/now_movie_playing_state.dart';
import 'package:filmvault/blocs/popular/movie_popular_bloc.dart';
import 'package:filmvault/blocs/popular/movie_popular_event.dart';
import 'package:filmvault/blocs/popular/movie_popular_state.dart';
import 'package:filmvault/blocs/top_rated/top_rated_bloc.dart';
import 'package:filmvault/blocs/top_rated/top_rated_event.dart';
import 'package:filmvault/blocs/top_rated/top_rated_state.dart';
import 'package:filmvault/blocs/upcoming/upcoming_movie_bloc.dart';
import 'package:filmvault/blocs/upcoming/upcoming_movie_event.dart';
import 'package:filmvault/blocs/upcoming/upcoming_movie_state.dart';
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
  final _movieTrendingBloc = inject<MovieTrendingBloc>();
  final _upComingMovieBloc = inject<UpComingMovieBloc>();
  final _topRatedBloc = inject<TopRatedBloc>();
  final _moviePopularBloc = inject<MoviePopularBloc>();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    _nowMoviePlayingBloc.add(NowMoviePlayingGet(1));
    _movieTrendingBloc.add(MovieTrendingGet(1));
    _upComingMovieBloc.add(UpComingMovieGet(1));
    _topRatedBloc.add(TopRatedGet(1));
    _moviePopularBloc.add(MoviePopularGet(1));
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
      body: RefreshIndicator(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: CustomPaddings.padding12_12_12_12(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: CustomSizes.hp20(context) * 5, // Tinggi slider
                    child: BlocBuilder(
                      bloc: _nowMoviePlayingBloc,
                      builder: (context, state) {
                        if (state is NowMovieLoadingPlaying) {
                          return ShimmerLoading(
                            isLoading: true,
                            child: Container(
                              height: CustomSizes.hp20(context) * 5,
                              width: CustomSizes.width(context),
                              color: Colors.grey,
                            ),
                          );
                        } else if (state is NowMovieSuccessPlaying) {
                          return PageView.builder(
                            itemCount: state.nowMovieResult.results.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  "${AppStrings.urlImagePath}${state.nowMovieResult.results[index].backdropPath}",
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
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
                      },
                    )),
                MovieSection.titleMenu(context, title: 'Trending saat ini'),
                SizedBox(
                  height: CustomSizes.hp4(context),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: BlocBuilder(
                    bloc: _movieTrendingBloc,
                    builder: (context, state) {
                      if (state is MovieLoadingTrending) {
                        return MovieSection.loadingConditionMovie(context);
                      } else if (state is MovieSuccessTrending) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: state.trendingMovieResult.results.map(
                                (item) {
                              return MovieSection.itemMovie(
                                context,
                                url:
                                '${AppStrings.urlImagePath}${item.backdropPath}',
                                onTap: () {},
                              );
                            },
                          ).toList(),
                        );
                      } else if (state is MovieFailedTrending) {}
                      return SizedBox();
                    },
                  ),
                ),
                SizedBox(
                  height: CustomSizes.hp4(context),
                ),
                MovieSection.titleMenu(context, title: 'Segera hadir'),
                SizedBox(
                  height: CustomSizes.hp4(context),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: BlocBuilder(
                    bloc: _upComingMovieBloc,
                    builder: (context, state) {
                      if (state is UpComingLoadingMovie) {
                        return MovieSection.loadingConditionMovie(context);
                      } else if (state is UpComingSuccessMovie) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: state.upComingMovieResult.results.map(
                                (item) {
                              return MovieSection.itemMovie(
                                context,
                                url:
                                '${AppStrings.urlImagePath}${item.backdropPath}',
                                onTap: () {},
                              );
                            },
                          ).toList(),
                        );
                      } else if (state is UpComingFailedMovie) {}

                      return SizedBox();
                    },
                  ),
                ),
                SizedBox(
                  height: CustomSizes.hp4(context),
                ),
                MovieSection.titleMenu(context, title: 'Trending'),
                SizedBox(
                  height: CustomSizes.hp4(context),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: BlocBuilder(
                    bloc: _topRatedBloc,
                    builder: (context, state) {
                      if (state is TopRatedLoading) {
                        return MovieSection.loadingConditionMovie(context);
                      } else if (state is TopRatedSuccess) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: state.topRatedResult.results.map(
                                (item) {
                              return MovieSection.itemMovie(
                                context,
                                url:
                                '${AppStrings.urlImagePath}${item.backdropPath}',
                                onTap: () {},
                              );
                            },
                          ).toList(),
                        );
                      } else if (state is TopRatedFailed) {}

                      return SizedBox();
                    },
                  ),
                ),
                SizedBox(
                  height: CustomSizes.hp4(context),
                ),
                MovieSection.titleMenu(context, title: 'Film terpopuler'),
                SizedBox(
                  height: CustomSizes.hp4(context),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: BlocBuilder(
                    bloc: _moviePopularBloc,
                    builder: (context, state) {
                      if (state is MovieLoadingPopular) {
                        return MovieSection.loadingConditionMovie(context);
                      } else if (state is MovieSuccessPopular) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: state.popularMovie.results.map(
                                (item) {
                              return MovieSection.itemMovie(
                                context,
                                url:
                                '${AppStrings.urlImagePath}${item.backdropPath}',
                                onTap: () {},
                              );
                            },
                          ).toList(),
                        );
                      } else if (state is MovieFailedPopular) {}

                      return SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        onRefresh: () {
          _loadData();
          return Future.delayed(const Duration(seconds: 3));
        },
      ),
    );
  }
}
