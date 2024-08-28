import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/features/settings_and_more/presentation/widgets/custom_list_tile.dart';
import 'package:gap/gap.dart';
import 'package:football/core/utils/app_info.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar( 
        backgroundColor: const Color(0xFF262626), 
        leadingWidth: 200,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                // Navigator.pop(context); 
              },
              icon:const Icon(CupertinoIcons.arrow_left,color: Colors.white,)),
              const Text("Settings",style: TextStyle(color: Colors.white,letterSpacing: 0,fontSize: 16),),

          ],
        ),
      ),
      body: ListView( 
        padding: const EdgeInsets.all(5),  
        children: [
          const Gap(5),
          const CustomListTile(title: "Theme",subtitle: "Dark",icon: Icons.nightlight,),
          const Gap(5),
          const CustomListTile(title: "Select the interface language",subtitle: "English",icon: Icons.language,),
          const Gap(5),
          const CustomListTile(title: "Currency",subtitle: "US Dollar (USD)",icon: Icons.attach_money,),
          const Gap(5),
          const CustomListTile(title: "Measurement system",subtitle: "Metric (cm)",icon: Icons.straighten,),
          const Gap(5),
          const ListTile(
            leading: Text("Others", style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500, letterSpacing: 0),),
          ),
          const Gap(5),
          const CustomListTile(title: "Share FotMob",icon: Icons.share,height: 50,),
          const Gap(5),
          const CustomListTile(title: "Follow us",icon: Icons.person_add_alt_sharp,height: 50,),
          const Gap(5),
          const CustomListTile(title: "Tips and support",icon: Icons.question_mark_sharp,height: 50,),
          const Gap(5),
          const CustomListTile(title: "Privacy policy",icon: CupertinoIcons.lock_shield_fill,height: 50,),
          const Gap(5),
          CustomListTile(title: "App version",subtitle: AppInfo.version,image:"assets/images/logo.png" ),
          const Gap(20)
          
        ],
      )
    );
  }
} 
