import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/utils/calculate_date_offset.dart';
import 'package:football/features/home/data/models/leagues/matches.dart';
import 'package:football/features/home/presentation/cubit/matches_cubit.dart';
import 'package:football/features/home/presentation/widgets/custom_expansion_tile.dart';
import 'package:football/features/home/presentation/widgets/matches_tab.dart';
import 'package:gap/gap.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 11,
      initialIndex: 3,
      child: Scaffold(
        backgroundColor: Colors.black, 
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
              backgroundColor: const Color(0xFF262626),
              expandedHeight: 100.0,
              toolbarHeight: 60,     
              floating:true,  
              pinned: true, 
              leading: Image.asset(
                'assets/images/name.png', 
                height: 35,
              ),
              leadingWidth: 130,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.access_time_sharp,
                    size: 23,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_today,
                    size: 23,
                    color: Colors.white,
                  ), 
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 23,
                    color: Colors.white,
                  ),
                ),
                IconButton( 
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 23,
                    color: Colors.white,
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50), 

                child: Container(
                  color: const Color(0xFF262626),
                  child: TabBar(
                    onTap: (value) {
                      print("on tap :$value");
                    },
                    isScrollable: true, 
                    physics: const BouncingScrollPhysics(),
                    tabs: [
                      Tab(text: formatDateFromToday(-3),),
                      Tab(text: formatDateFromToday(-2),),
                      const Tab(text:  'Yesterday'), 
                      const Tab(text:  'Today'),
                      const Tab(text:  'Tomorrow'),
                      Tab(text: formatDateFromToday(2),), 
                      Tab(text:  formatDateFromToday(3)),
                      Tab(text: formatDateFromToday(4),), 
                      Tab(text: formatDateFromToday(5),), 
                      Tab(text:  formatDateFromToday(6)),
                      Tab(text: formatDateFromToday(7),), 
                    ], 
                    indicatorColor: Colors.green,
                    dividerColor: Colors.black,  
                    indicatorWeight: 4.0,
                    labelColor: Colors.white,
                    labelPadding: EdgeInsets.symmetric(horizontal: 8),
                    unselectedLabelColor: Colors.grey,
                    tabAlignment: TabAlignment.start,
                  ),
                ),
              ),
            ),
            ];
          }, 
         
          body: TabBarView(
                
                children: List.generate(11, (index) { 
                  if(index ==3){
                    return  MatchesTabContent(dateOffset:index-3); 
                  }
                  return Container(child: Center(child: Text(formatDateFromToday(-3+index)),),);
                },
              ),
            ),
        ),
      ),
    );
  }
}
































