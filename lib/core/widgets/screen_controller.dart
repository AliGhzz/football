import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/config/themes/cubit/theme_switcher_cubit.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:football/core/widgets/bottom_navigation_Bar.dart';
import 'package:football/features/matches/presentation/screens/matches_screen.dart';
import 'package:football/features/news/presentation/screens/news_screen.dart';
import 'package:football/features/settings_and_more/presentation/screens/more_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final themeState = context.read<ThemeSwitcherCubit>().state;
    if (themeState.theme == "Dark") {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF141414),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xFF141414)));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Color(0xFF1a1a1a)));
    }

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

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    return Center(
      child: Text(text.leagues),
    );
  }
}

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    return Center(
      child: Text(text.follwing),
    );
  }
}
