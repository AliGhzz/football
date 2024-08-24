import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  const CustomBottomNavigationBar({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      backgroundColor: const Color(0xFF262626),
      selectedItemColor: const Color(0xFF60df6e) , 
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(
        applyTextScaling: true,
        // size: 25
      ),
      iconSize: 25, 
      showUnselectedLabels: true,
      onTap: (value) {
        BlocProvider.of<ScreenIndexCubit>(context).changeScreen(value);
      }, 
      type: BottomNavigationBarType.fixed,
      currentIndex: index, 
      selectedLabelStyle: const TextStyle(letterSpacing: 0,fontWeight: FontWeight.w500,fontSize: 13),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(index==0 ?"assets/images/soccer-field.png":"assets/images/soccer-field2.png",width:25,color: index==0?Colors.green:Colors.grey,),
          label: 'Matches'
        ),
        BottomNavigationBarItem(
          icon: Icon(index==1 ? Icons.article :Icons.article_outlined),
          label: 'News' 
        ),
        BottomNavigationBarItem(
          icon: Image.asset(index==2 ?"assets/images/trophy.png":"assets/images/trophy2.png",width:25,color: index==2?Colors.green:Colors.grey,),
          label: 'Leagues'
        ),
        BottomNavigationBarItem(
          icon: Image.asset(index==3 ?"assets/images/star.png":"assets/images/star2.png",width:25,color: index==3?Colors.green:Colors.grey,),
          label: 'Following' 
        ),
        const BottomNavigationBarItem( 
          icon: Icon(CupertinoIcons.bars),
          label: 'More'
        ),
      ],
    );
  }
}