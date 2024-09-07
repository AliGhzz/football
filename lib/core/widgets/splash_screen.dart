import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:football/features/news/presentation/cubit/trending_news/news_cubit.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  bool isListenerExecuted = false;
  @override
  Widget build(BuildContext context) {
    context.read<LocationCubit>().getLocation();
    BlocProvider.of<NewsCubit>(context).getTrendingNews();
    BlocProvider.of<NewsCubit>(context).getWorldNews();
    BlocProvider.of<NewsCubit>(context).getTopTransfers();

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
                print("timezone:::: ${locationState.location.timezone} --- ${locationState.location.ccode3}");
                BlocProvider.of<MatchesCubit>(context)
                    .changeTab(context: context);
              },
              child: BlocConsumer<MatchesCubit, MatchesState>(
                listener: (context, state) {
                  if (state.isLoaded! ==true && state.hasError==false && state.isLoading==false &&
                      isListenerExecuted == false) {
                    isListenerExecuted = true;
                    print("Navigator.pushNamed(context, '/home');");
                    Navigator.pushNamed(context, '/home');
                  }
                },
                builder: (context, state) {
                  if (state.hasError && state.isLoading == false) {
                    return TextButton(
                        onPressed: () {
                          BlocProvider.of<MatchesCubit>(context)
                              .changeTab(context: context);
                        },
                        child:  Text(
                          text.tryAgain,
                          style: TextStyle(
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
                },
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
