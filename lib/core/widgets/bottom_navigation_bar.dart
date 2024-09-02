import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  const CustomBottomNavigationBar({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    return Container(
      height: 125,  
      color: Theme.of(context).colorScheme.surface,
      child: BottomNavigationBar(
        iconSize: 25, 
        onTap: (value) {
          BlocProvider.of<ScreenIndexCubit>(context).changeScreen(value);
        }, 
        type: BottomNavigationBarType.fixed,
        currentIndex: index, 
        selectedLabelStyle: const TextStyle(letterSpacing: 0,fontWeight: FontWeight.w500,fontSize: 13),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(index==0 ?"assets/images/soccer-field.png":"assets/images/soccer-field2.png",width:25,color: index==0?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,),
            label: text.matches
          ),
          BottomNavigationBarItem(
            icon: Icon(index==1 ? Icons.article :Icons.article_outlined),
            label: text.news 
          ),
          BottomNavigationBarItem(
            icon: Image.asset(index==2 ?"assets/images/trophy.png":"assets/images/trophy2.png",width:25,color: index==2?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),
            label: text.leagues
          ),
          BottomNavigationBarItem(
            icon: Image.asset(index==3 ?"assets/images/star.png":"assets/images/star2.png",width:25,color: index==3?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),
            label: text.follwing
          ),
          BottomNavigationBarItem( 
            icon: const Icon(CupertinoIcons.bars),
            label: text.more
          ),
        ],
      ),
    );
  }
}