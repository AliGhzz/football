import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        toolbarHeight: 62, 
        title:  Text(text.more,style: TextStyle(fontSize: 18,color: Colors.white),),
        leadingWidth: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20,),  
            child: CircleAvatar(
              radius: 15, 
              child: Image.asset("assets/images/man.png",height: 65,), 
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10), 
        children: [ 
          ListTile(
            leading: const Icon(Icons.swap_horizontal_circle,color: Color(0xff3bc3a2),size: 25,), 
            title:  Text(text.transferCenter, style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            },
          ),
          const Gap(5),
           ListTile(
            leading: const Icon(Icons.tv  ,color: Colors.grey ,size: 25,),   
            title:  Text(text.tvSchedules, style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            subtitle:  Text(text.franceGermany,style: TextStyle(color: Colors.grey , fontSize: 13 , fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            },
          ),
          const Gap(5),
          ListTile(
            leading: Image.asset("assets/images/logo.png",height:25,color: const Color(0xff60df6e) ,), 
            title:  Text(text.fotmobSupportersClub, style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            subtitle:  Text(text.removeAds,style: TextStyle(color: Colors.grey , fontSize: 13 , fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            },
          ),
          const Gap(5),
          ListTile(
            leading: const Icon(Icons.edit_notifications ,color: Colors.white,size: 25,),   
            title:  Text(text.notifications, style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            subtitle:  Text(text.manageAllYourActiveNews,style: TextStyle(color: Colors.grey , fontSize: 13 , fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            }, 
          ),
          const Gap(5),
          ListTile(
            leading: const Icon(Icons.settings,color: Colors.white,size: 25,), 
            title:  Text(text.settings, style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ) 
    ); 
  }
}