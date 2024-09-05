import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football/config/themes/app_themes/app_theme.dart';
import 'package:football/config/themes/cubit/theme_switcher_cubit.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/core/widgets/screen_controller.dart';
import 'package:football/core/widgets/splash_screen.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:football/features/news/presentation/cubit/trending_news_cubit.dart';
import 'package:football/features/news/presentation/cubit/world_news_cubit.dart';
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

  //setup get_it for dependency injection
  setup();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(const FootballApp());
}

class FootballApp extends StatelessWidget {
  const FootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchesCubit>(
          create: (context) => MatchesCubit(getIt()),
        ),
        BlocProvider<ScreenIndexCubit>(
          create: (context) => ScreenIndexCubit(),
        ),
        BlocProvider<TranslationsBloc>(
          create: (context) => TranslationsBloc(),
        ),
        BlocProvider<ThemeSwitcherCubit>(
          create: (context) => ThemeSwitcherCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(getIt()),
        ),
        BlocProvider<TrendingNewsCubit>(
          create: (context) => TrendingNewsCubit(getIt()),
        ),
        BlocProvider<WorldNewsCubit>(
          create: (context) => WorldNewsCubit(getIt()),
        ),
      ],
      child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
        builder: (context, themeState) {
          return BlocBuilder<TranslationsBloc, TranslationsState>(
            builder: (context, languageState) {
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
