import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:football/core/widgets/bottom_navigation_Bar.dart';
import 'package:football/features/matches/presentation/screens/matches_screen.dart';
import 'package:football/features/settings_and_more/presentation/screens/more_screen.dart';

class ScreenController extends StatelessWidget {
  ScreenController({super.key});

  final List<Widget> screen = [
    const MatchesScreen(),
    const NewsScreen(),
    const LeaguesScreen(),
    const FollowingScreen(),
    const MoreScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenIndexCubit, int>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(index: state),
          body: screen[state],
        );
      },
    );
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("News"),
    );
  }
}

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Leagues"),
    );
  }
}

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Following"),
    );
  }
}


