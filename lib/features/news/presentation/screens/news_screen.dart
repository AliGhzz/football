import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/features/news/presentation/cubit/news_cubit.dart';
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
                        padding: EdgeInsetsDirectional.only(start: 13),
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 13),
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
          // slivers: [
          body: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state.newsState is NewsLoading) {
                print("if(state.newsState is NewsLoading){");
                return Center(child: CircularProgressIndicator());
              } else if (state.newsState is NewsError) {
                print("}else if (state.newsState is NewsError){");
                return Container(child: Text("Got error"));
              } else if (state.newsState is NewsLoaded) {
                print("}else if (state.newsState is NewsLoaded){");
                NewsLoaded newsLoaded = state.newsState as NewsLoaded;
                // return Text("data");
                // return NewsWidget(news: newsLoaded[index])
                return ListView.builder(
                    itemCount: newsLoaded.trending.news!.length + 2 +1 ,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: Platform.isWindows
                              ? const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10)
                              : EdgeInsets.fromLTRB(15, 5, 15, 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green, 
                                child: Icon(Icons.trending_up,color: Colors.black,size: 20,),
                              ),
                              Gap(10),
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
                      } else if (index<6){
                        return TrendingNewsWidget(
                          news: newsLoaded.trending.news![index - 1],
                          isBig: index > 1 ? false : true,
                        );
                      }else if(index==6){
                        return Padding(
                          padding: Platform.isWindows
                              ? const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10)
                              : EdgeInsets.fromLTRB(15, 5, 15, 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.yellow,  
                                child: Icon(Icons.public_outlined,color: Colors.black,size: 20,),
                              ), 
                              Gap(10),
                              Padding(
                                padding: const EdgeInsets.only(bottom:3.0),
                                child: Text(  
                                  text.world,
                                  style: textTheme.titleLarge, 
                                ),
                              )
                            ], 
                          ), 
                        );
                      }else{
                        return Container(
                          height: 240,  
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, 
                            itemCount: newsLoaded.trending.news!.length+2,
                            itemBuilder: (context, index) {
                              if(index==0 || index==6){
                                return Gap(10);
                              }
                              return WorldNewsWidget(news: newsLoaded.trending.news![index-1],);
                            },
                            
                          ),
                        );
                      }
                    });
              }
              return Text("Nothing");
            },
          ),
        ),
      ),
    );
  }
}
