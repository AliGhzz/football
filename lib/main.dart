import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football/config/themes/app_themes/app_theme.dart';
import 'package:football/config/themes/cubit/theme_switcher_cubit.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/core/widgets/screen_controller.dart';
import 'package:football/core/widgets/splash_screen.dart';
import 'package:football/features/leagues/presentation/cubit/leagues_cubit.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:football/features/news/presentation/cubit/trending_news/news_cubit.dart';
import 'package:football/features/settings_and_more/presentation/screens/settings.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/utils/app_info.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF1a1a1a),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Color(0xFF1a1a1a)));

  // using this for showing app version in settings screen
  await AppInfo.init();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  //setup get_it for dependency injection
  setup();

  runApp(const FootballApp());
}

class FootballApp extends StatelessWidget {
  const FootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchesCubit>(
          create: (context) => getIt<MatchesCubit>(),
        ),
        BlocProvider<ScreenIndexCubit>(
          create: (context) => getIt<ScreenIndexCubit>(),
        ),
        BlocProvider<TranslationsBloc>(
          create: (context) => getIt<TranslationsBloc>(),
        ),
        BlocProvider<ThemeSwitcherCubit>(
          create: (context) => getIt<ThemeSwitcherCubit>(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => getIt<LocationCubit>(),
        ),
        BlocProvider<NewsCubit>(
          create: (context) => getIt<NewsCubit>(),
        ),
        BlocProvider<LeaguesCubit>(
          create: (context) => getIt<LeaguesCubit>(),
        ),
      ],
      child: BlocBuilder<TranslationsBloc, TranslationsState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
            builder: (context, themeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/': (context) => SplashScreen(),
                  '/settings': (context) => const SettingsScreen(),
                  '/home': (context) => ScreenController(),
                },
                locale: languageState.locale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('fa'),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                themeMode: themeState.themeMode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
              );
            },
          );
        },
      ),
    );
  }
}
