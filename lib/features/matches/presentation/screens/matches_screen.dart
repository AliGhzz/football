import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/utils/calculate_date_offset.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:football/features/matches/presentation/widgets/custom_expansion_tile.dart';
import 'package:lottie/lottie.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 11, vsync: this,initialIndex: 3);

    tabController.addListener(() {
      if (tabController.indexIsChanging == false) {
        final index = tabController.index; 
        context.read<MatchesCubit>().changeTab(index:index);
      }
    });

    context.read<MatchesCubit>().changeTab();
   
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: const Color(0xFF1a1a1a),
              expandedHeight: 105.0,
              toolbarHeight: 50,  
              floating: true,
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
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  color:const Color(0xFF1a1a1a),
                  child: TabBar(
                    controller: tabController, 
                    onTap: (value) {
                      BlocProvider.of<MatchesCubit>(context)
                          .changeTab(index: value);
                    },
                    isScrollable: true, 
                    physics: const BouncingScrollPhysics(),
                    tabs: [
                      Tab(
                        text: formatDateFromToday(-3),
                      ),
                      Tab(
                        text: formatDateFromToday(-2),
                      ),
                      const Tab(text: 'Yesterday'),
                      const Tab(text: 'Today'),
                      const Tab(text: 'Tomorrow'),
                      Tab(
                        text: formatDateFromToday(2),
                      ),
                      Tab(text: formatDateFromToday(3)),
                      Tab(
                        text: formatDateFromToday(4),
                      ),
                      Tab(
                        text: formatDateFromToday(5),
                      ),
                      Tab(text: formatDateFromToday(6)),
                      Tab(
                        text: formatDateFromToday(7),
                      ),
                    ],
                    indicatorColor: Colors.green,
                    dividerColor: Colors.black,
                    indicatorWeight: 4.0,
                    labelColor: Colors.white,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    unselectedLabelColor: Colors.grey,
                    tabAlignment: TabAlignment.start,
                  ),
                ),
              ),
            ),
          ];
        },
        body: BlocBuilder<MatchesCubit, MatchesState>(
          builder: (context, state) {
            if(state.isLoading ){
              return Center( 
                child: SizedBox(
                  height: 200, 
                  width: 200, 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset('assets/animations/loading.json'),
                  ),
                ), 
              );
            }else if(state.hasError){
              return Column(
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
                      BlocProvider.of<MatchesCubit>(context).changeTab(index:tabController.index);
                    },
                    child:  const Text("Try again",style: TextStyle(color: Colors.red,fontSize: 25),),
                  ),
                ],
              );
            }
            return TabBarView(
              controller: tabController,
              children: List.generate(
                11,
                (index) {
                  if(state.loadedData[index-3] != null) { 
                    return ListView.builder(  
                      itemCount: state.loadedData[index-3]!.leagues!.length,  
                      itemBuilder: (context, listIndex) {  
                        return CustomExpansionTile(league: state.loadedData[index-3]!.leagues![listIndex]);
                      }, 
                    );
                  }
                  return Center(
                    child: SizedBox(
                      height: 200, 
                      width: 200, 
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Lottie.asset('assets/animations/loading.json'),
                      ),
                    ), 
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
