import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  bool isListenerExecuted = false;
  @override
  Widget build(BuildContext context) {
    context.read<LocationCubit>().getLocation();
    

    // Future.delayed(const Duration(milliseconds: 3000)).then((value) {
    //   Navigator.pushNamed(context,'/home');
    // },);

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
              listener: (context, state) {
                BlocProvider.of<MatchesCubit>(context).changeTab(context: context);
              },
              child: BlocConsumer<MatchesCubit, MatchesState>(
                listener: (context, state) {
                  if (state.loadedData.containsKey(0) &&
                      isListenerExecuted == false) {
                    isListenerExecuted = true;
                    print("if(state.loadedData.containsKey(0)){");
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
                        child: const Text(
                          "Try again",
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
            // Image.asset("assets/images/name.png",height: 40,),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
