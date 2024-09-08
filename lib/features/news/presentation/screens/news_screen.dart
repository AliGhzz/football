import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/features/news/data/models/news_models/trending_news.dart';
import 'package:football/features/news/presentation/cubit/news_cubit.dart';
import 'package:football/features/news/presentation/widgets/top_transfer_widget.dart';
import 'package:football/features/news/presentation/widgets/trending_news_widget.dart';
import 'package:football/features/news/presentation/widgets/world_news_widget.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

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

  bool isAnimating = false;
  int lastIndex =-1 ;
  void animateToTab(int index) async{
    if (isAnimating) {
      tabController.index = lastIndex;
      return;
    }
    lastIndex = index;
    isAnimating = true;

    double sum = 0;
    for(int i =0;i<index;i++){
      final key = keys[i];
      sum += key.currentContext!.size!.height;
    }
    scrollController.removeListener(handleScroll);
    await scrollController.animateTo(sum,duration:const Duration(milliseconds:500),curve:Curves.linear);
    scrollController.addListener(handleScroll);

    lastIndex = tabController.previousIndex ;
    isAnimating = false;
    
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
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state.trendingNews.isLoading || state.worldNews.isLoading || state.topTransfers.isLoading ) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height-280, 
                  ),
                  child: Center(
                    child: SizedBox( 
                      height: 200,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Lottie.asset('assets/animations/loading.json'),
                      ),
                    ),
                  ),
                );
              } else if (  state.trendingNews.hasError || state.worldNews.hasError || state.topTransfers.hasError) { 
                return ConstrainedBox(
                   constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height-280, 
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Lottie.asset('assets/animations/error.json'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          getIt<NewsCubit>().getTopTransfers();
                          getIt<NewsCubit>().getWorldNews();
                          getIt<NewsCubit>().getTrendingNews();
                        },
                        child: Text(
                          text.tryAgain,
                          style: const TextStyle(color: Colors.red, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                );
              } else { 
                TrendingNews trendingNews = state.trendingNews.trendingNews!;
                return Column(
                  children: [
                    ListView.builder( 
                      key: keys[0],
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
                                      text.trending, 
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
                        }
                      ),

                      ListView.builder(
                        key: keys[1],
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
                                itemCount: state.worldNews.worldNews!.news!.length + 2 - 4 , 
                                itemBuilder: (context, innerIndex) { 
                                  if(innerIndex==0 || innerIndex ==state.worldNews.worldNews!.news!.length + 2 - 5){
                                    return const Gap(10);
                                  }else{
                                    return WorldNewsWidget(news: state.worldNews.worldNews!.news![innerIndex-1],);
                                  }
                                },
                              ),
                            );
                          }
                          else{  
                            return TrendingNewsWidget(
                              news: state.worldNews.worldNews!.news![state.worldNews.worldNews!.news!.length -4 -2 + index],
                              isBig: false ,
                            ); 
                          }
                        },
                       
                    ),


                    TopTransferWidget(transfers: state.topTransfers.topTransfers!,key: keys[2],)
                  ],
                );
              
              }
            },
          ),
        ),
      ),
    );
  }
}
