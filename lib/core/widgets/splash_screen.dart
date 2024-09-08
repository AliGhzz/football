
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:football/features/news/presentation/cubit/news_cubit.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isListenerExecuted = false;
  // Timer? timer;

  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(Duration(seconds: 5), (timer) {
  //     getIt<LocationCubit>().getLocation();
  //     getIt<NewsCubit>().getTopTransfers();
  //     getIt<NewsCubit>().getWorldNews();
  //     getIt<NewsCubit>().getTrendingNews();
  //     isListenerExecuted = false;
  //   });
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    getIt<LocationCubit>().getLocation();
    getIt<NewsCubit>().getTopTransfers();
    getIt<NewsCubit>().getWorldNews();
    getIt<NewsCubit>().getTrendingNews();
    
    AppLocalizations text = AppLocalizations.of(context)!;
    return SafeArea(
      child: Container(
        color: const Color(0xFF1a1a1a),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const MaxGap(550),
            Image.asset("assets/images/logo.png", height: 110),
            const MaxGap(500),
            BlocListener<LocationCubit, LocationState>(
              listener: (context, locationState) {
                getIt<MatchesCubit>().changeTab();    
              },
              child: BlocListener<MatchesCubit, MatchesState>(
                listener: (context, state) {
                  if (state.isLoaded! ==true && state.hasError==false && state.isLoading==false &&
                      isListenerExecuted == false) {
                    isListenerExecuted = true;
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: BlocBuilder<MatchesCubit,MatchesState>(
                  builder: (context, state) {
                    if (state.hasError && state.isLoading == false) {
                      return TextButton(
                          onPressed: () {
                            getIt<MatchesCubit>().changeTab();
                            getIt<NewsCubit>().getTopTransfers();
                            getIt<NewsCubit>().getWorldNews();
                            getIt<NewsCubit>().getTrendingNews();
                          },
                          child:  Text(
                            text.tryAgain,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 0),
                          ));
                    } else {
                      return Image.asset(
                        "assets/images/name.png",
                        height: 40,
                      );
                    }
                  } 
                    
                  
                )
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
