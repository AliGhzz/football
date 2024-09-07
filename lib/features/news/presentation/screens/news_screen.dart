import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/config/themes/cubit/theme_switcher_cubit.dart';
import 'package:football/features/news/data/models/news_models/trending_news.dart';
import 'package:football/features/news/presentation/cubit/top_transfers/top_transfers_cubit.dart';
import 'package:football/features/news/presentation/cubit/trending_news/trending_news_cubit.dart';
import 'package:football/features/news/presentation/cubit/world_news/world_news_cubit.dart';
import 'package:football/features/news/presentation/widgets/top_transfer_widget.dart';
import 'package:football/features/news/presentation/widgets/trending_news_widget.dart';
import 'package:football/features/news/presentation/widgets/world_news_widget.dart';
import 'package:gap/gap.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with TickerProviderStateMixin {
  List<GlobalKey> keys = List.generate(3, (index) => GlobalKey());
 
  late ScrollController scrollController ;
  late TabController tabController ;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 3, vsync: this,initialIndex: 0);
    scrollController = ScrollController();
    scrollController.addListener(handleScroll);
  }

  void handleScroll() {
    double sum = 0;
    for (int i = 0; i < keys.length;i++) {
      final key = keys[i];
      sum += key.currentContext!.size!.height;
      if(scrollController.offset <= sum){
        tabController.animateTo(i);
        break;
      }
    }
  }

  void animateToTab(int index) async{
    double sum = 0;
    for(int i =0;i<index;i++){
      final key = keys[i];
      sum += key.currentContext!.size!.height;
    }
    scrollController.removeListener(handleScroll);
    await scrollController.animateTo(sum,duration:Duration(milliseconds: 500),curve:Curves.linear);
    scrollController.addListener(handleScroll);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface, 
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
                      controller: tabController,
                      padding: const EdgeInsetsDirectional.only(start: 13),
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 13),
                      onTap: (value) {
                        animateToTab(value);
                      },
                      tabs: [
                        Tab(
                          child: Text(
                            text.forYou,
                            style: textTheme.bodyMedium,
                          ),
                        ),
                        Tab(
                          child: Text(
                            text.latest,
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
          controller: scrollController,
          child: Column(
            children: [
              BlocBuilder<TrendingNewsCubit, TrendingNewsState>(
                key: keys[0],
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.hasError) { 
                    return TextButton(onPressed: (){
                            BlocProvider.of<TrendingNewsCubit>(context).getTrendingNews();
                            BlocProvider.of<WorldNewsCubit>(context).getWorldNews();
                            BlocProvider.of<TopTransfersCubit>(context).getTopTransfers();
                      }, child: const Text("Try again"));
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
                key: keys[1],
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.hasError) {
                    return  TextButton(onPressed: (){
                            BlocProvider.of<TrendingNewsCubit>(context).getTrendingNews();
                            BlocProvider.of<WorldNewsCubit>(context).getWorldNews();
                            BlocProvider.of<TopTransfersCubit>(context).getTopTransfers();
                      }, child: const Text("Try again"));
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
    
    
    
            BlocBuilder<TopTransfersCubit,TopTransfersState>(
              key: keys[2],
              builder: (context, state) {
                if (state.isLoading){
                  return const Center(child: CircularProgressIndicator());
                } else if (state.hasError) {
                  return  TextButton(
                    onPressed: (){
                      BlocProvider.of<TrendingNewsCubit>(context).getTrendingNews();
                      BlocProvider.of<WorldNewsCubit>(context).getWorldNews();
                      BlocProvider.of<TopTransfersCubit>(context).getTopTransfers();
                      }, 
                    child: const Text("Try again")
                  );
                }else{
                  return TopTransferWidget(transfers: state.topTransfers!);
                }
              },
            )
    
    
    
            ],
          ),
        ),
      ),
    );
  }
}
