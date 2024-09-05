import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/features/news/data/models/trending_news.dart';
import 'package:football/features/news/presentation/cubit/trending_news_cubit.dart';
import 'package:football/features/news/presentation/cubit/world_news_cubit.dart';
import 'package:football/features/news/presentation/widgets/trending_news_widget.dart';
import 'package:football/features/news/presentation/widgets/world_news_widget.dart';
import 'package:gap/gap.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 50,
                expandedHeight: 105.0,
                title: Text(text.news),
                leadingWidth: 10,
                leading: Container(),
                floating: true,
                pinned: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune,
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: ColoredBox(
                    color: Theme.of(context).appBarTheme.backgroundColor!,
                    child: TabBar(
                        padding: const EdgeInsetsDirectional.only(start: 13),
                        isScrollable: true,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 13),
                        tabAlignment: TabAlignment.start,
                        tabs: [
                          Tab(
                            child: Text(
                              text.forYou,
                              style: textTheme.bodyMedium,
                            ),
                          ),
                          Tab(
                            child: Text(
                              text.world,
                              style: textTheme.bodyMedium,
                            ),
                          ),
                          Tab(
                            child: Text(
                              text.transfer,
                              style: textTheme.bodyMedium,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ];
          },


          body: SingleChildScrollView(
            child: Column(
              children: [


                BlocBuilder<TrendingNewsCubit, TrendingNewsState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.hasError) { 
                      return Container(
                        child: TextButton(onPressed: (){
                              BlocProvider.of<TrendingNewsCubit>(context).getTrendingNews();

                        }, child: const Text("got error"))
                      );
                    } else { 
                      TrendingNews trendingNews = state.trendingNews!;
                      return ListView.builder( 
                        shrinkWrap: true, 
                        physics: const NeverScrollableScrollPhysics(),
                          itemCount: trendingNews.news!.length+1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Padding(
                                padding: Platform.isWindows
                                    ? const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10)
                                    : const EdgeInsets.fromLTRB(15, 5, 15, 15),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.green, 
                                      child: Icon(Icons.trending_up,color: Colors.black,size: 20,),
                                    ),
                                    const Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:3.0),
                                      child: Text(
                                        "Trending", 
                                        style: textTheme.titleLarge,
                                      ),
                                    )
                                  ], 
                                ),
                              );
                            } else {
                              return TrendingNewsWidget(
                                news: trendingNews.news![index - 1],
                                isBig: index > 1 ? false : true,
                              );
                            }
                          });
                    }
                  },
                ),




                BlocBuilder<WorldNewsCubit, WorldNewsState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.hasError) {
                      return Container(
                        child: TextButton(onPressed: (){
                              BlocProvider.of<WorldNewsCubit>(context).getWorldNews();

                        }, child: const Text("got error"))
                      );
                    } else { 
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          if (index == 0){
                            return Padding(
                              padding: Platform.isWindows
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 10)
                                  : const EdgeInsets.fromLTRB(15, 5, 15, 15),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.yellow,  
                                    child: Icon(Icons.public_outlined,color: Colors.black,size: 20,),
                                  ), 
                                  const Gap(10),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:3.0),
                                    child: Text(  
                                      text.worldNews,
                                      style: textTheme.titleLarge, 
                                    ),
                                  )
                                ], 
                              ), 
                            );
                          }else if(index == 1){
                            return SizedBox(
                              height: 240,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal, 
                                itemCount: state.worldNews!.news!.length + 2 - 4 , 
                                itemBuilder: (context, innerIndex) { 
                                  if(innerIndex==0 || innerIndex ==state.worldNews!.news!.length + 2 - 5){
                                    return const Gap(10);
                                  }else{
                                    return WorldNewsWidget(news: state.worldNews!.news![innerIndex-1],);
                                  }
                                },
                              ),
                            );
                          }
                          else{  
                            return TrendingNewsWidget(
                                news: state.worldNews!.news![state.worldNews!.news!.length -4 -2 + index],
                                isBig: false ,
                              ); 
                          }
                        },
                         
                      );
                      
                      
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
