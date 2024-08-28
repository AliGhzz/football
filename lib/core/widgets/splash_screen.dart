
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MatchesCubit>(context).changeTab();
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      Navigator.pushNamed(context,'/home');
    },);
     
    return SafeArea( 
      child: Container(
        color: const Color(0xFF262626),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MaxGap(550),
            Image.asset("assets/images/logo.png",height:110),
            const MaxGap(500),
            Image.asset("assets/images/name.png",height: 40,),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
