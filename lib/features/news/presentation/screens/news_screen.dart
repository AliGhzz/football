import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/features/news/presentation/cubit/news_cubit.dart';
import 'package:football/features/news/presentation/widgets/news_widget.dart';
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
                  color:Theme.of(context).appBarTheme.backgroundColor!,
                  child: TabBar(
                    
                      padding: EdgeInsetsDirectional.only(start: 13),
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 13),
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(
                          text: text.forYou,
                        ),
                        Tab(
                          text: text.latest,
                        ),
                        Tab(
                          text: text.transfer,
                        ),
                      ]),
                ),
              ),
            ),
            ];
          },
          // slivers: [
          body: 
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if(state.newsState is NewsLoading){
                  print("if(state.newsState is NewsLoading){");
                  return Center(child: CircularProgressIndicator());
                }else if (state.newsState is NewsError){
                  print("}else if (state.newsState is NewsError){");
                  return Container(child: Text("Got error"));
                }else if (state.newsState is NewsLoaded){
                  print("}else if (state.newsState is NewsLoaded){");
                  NewsLoaded newsLoaded = state.newsState  as NewsLoaded;
                  // return Text("data");
                  // return NewsWidget(news: newsLoaded[index])
                  return ListView.builder( 
                    itemCount: newsLoaded.trending.news!.length+1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.trending_up,
                                color: Colors.green,
                                size: 35,
                              ),
                              Gap(10),
                              Text(
                                "Trending",
                                style: textTheme.titleLarge,
                              ) 
                            ],
                          ), 
                        ); 
                      } else {
                        return NewsWidget(news: newsLoaded.trending.news![index-1], index: index,isBig:index>1 ? false : true ,);  
                      }
                    }
                  );
                }
                return Text("Nothing");
                // return SliverList.builder(
                //     itemCount: 6,
                //     itemBuilder: (context, index) {
                //       if (index == 0) {
                //         return Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 15.0, vertical: 10),
                //           child: Row(
                //             children: [
                //               Icon(
                //                 Icons.trending_up,
                //                 color: Colors.green,
                //                 size: 35,
                //               ),
                //               Gap(10),
                //               Text(
                //                 "Trending",
                //                 style: textTheme.titleLarge,
                //               )
                //             ],
                //           ),
                //         );
                //       } else {
                //         if(state is NewsLoading){
                //           return CircularProgressIndicator();
                //         }else if (state is NewsError){
                //           return Text("Got error");
                //         }else if (state is NewsLoaded){
                //           return 
                //         }
                //         return Text("Nothing");
                        
                //       }
                //     }
                //   );
              },
            ),
          // ],
          // child: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(text.news),
          //       ElevatedButton(onPressed: (){
          //         BlocProvider.of<NewsCubit>(context).getNews();
          //       }, child: Text("get latest news",style: textTheme.bodyMedium,))
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
