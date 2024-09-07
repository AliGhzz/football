import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/utils/calculate_date_offset.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:football/features/matches/presentation/widgets/custom_expansion_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState(){
    super.initState();
    
    tabController = TabController(length: 11, vsync: this, initialIndex: 3);

    tabController.addListener(() {
      if (tabController.indexIsChanging == false) {
        final index = tabController.index;
        context.read<MatchesCubit>().changeTab(index: index, context: context);
      }
    });
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations text = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true ,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // رنگ شفاف برای AppBar
              expandedHeight: 105.0,
              toolbarHeight: 50,
              floating: true,
              pinned: true,
              leading: Padding(
                padding: const EdgeInsetsDirectional.only(start: 15),
                child: Image.asset(
                  'assets/images/name.png',
                  height: 35,
                  color: Theme.of(context).tabBarTheme.labelColor,
                ),
              ),
              leadingWidth: 145,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.access_time_sharp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_today,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: ColoredBox(
                  color: Theme.of(context).appBarTheme.backgroundColor!,
                  child: TabBar(
                    controller: tabController,
                    onTap: (value) {
                      BlocProvider.of<MatchesCubit>(context)
                          .changeTab(index: value, context: context);
                    },
                    isScrollable: true,
                    tabs: [
                      Tab(
                        // text: formatDateFromToday(-3),
                        child: Text(
                          formatDateFromToday(-3),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          formatDateFromToday(-2),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Yesterday",
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                          child: Text(
                        "Today",
                        style: textTheme.bodyMedium,
                      )),
                      Tab(
                          child: Text(
                        "Tomorrow",
                        style: textTheme.bodyMedium,
                      )),
                      Tab(
                        child: Text(
                          formatDateFromToday(2),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          formatDateFromToday(3),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          formatDateFromToday(4),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          formatDateFromToday(5),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          formatDateFromToday(6),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          formatDateFromToday(7),
                          style: textTheme.bodyMedium,
                        ),
                      ),
                    ],
                    indicatorWeight: 4.0,
                  ),
                ),
              ),
            ),
          ];
        },
        body: BlocBuilder<MatchesCubit, MatchesState>(
          builder: (context, state) {
            if (state.isLoading) {
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
            } else if (state.hasError) {
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
                      BlocProvider.of<MatchesCubit>(context).changeTab(
                          index: tabController.index, context: context);
                    },
                    child:  Text(
                      text.tryAgain,
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  ),
                ],
              );
            }
            return TabBarView(
              controller: tabController,
              children: List.generate(
                11,
                (index) {
                  if (state.loadedData[index - 3] != null) {
                    return ListView.builder(
                      itemCount: state.loadedData[index - 3]!.leagues!.length,
                      itemBuilder: (context, listIndex) {
                        return CustomExpansionTile(
                            league: state
                                .loadedData[index - 3]!.leagues![listIndex]);
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
