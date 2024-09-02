import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 62, 
        title:  Text(text.more),
        leadingWidth: 10,
        leading: Container(),  
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
            leading: const Icon(Icons.settings), 
            title:  Text(text.settings, style: textTheme.titleMedium,),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Gap(5),
          ListTile(
            leading: const Icon(Icons.swap_horizontal_circle,color: Color(0xff3bc3a2),), 
            title:  Text(text.transferCenter, style: textTheme.titleMedium,),
            onTap: () {
              
            },
          ),
          const Gap(5),
           ListTile(
            leading: const Icon(Icons.tv  ,color: Colors.grey ,),   
            title:  Text(text.tvSchedules, style: textTheme.titleMedium,),
            subtitle:  Text(text.franceGermany,style: textTheme.bodySmall),
            onTap: () {
              
            },
          ),
          const Gap(5),
          ListTile(
            leading: Image.asset("assets/images/logo.png",height:25,color: const Color(0xff60df6e) ,), 
            title:  Text(text.fotmobSupportersClub, style: textTheme.titleMedium,),
            subtitle:  Text(text.removeAds,style: textTheme.bodySmall),
            onTap: () {
              
            },
          ),
          const Gap(5),
          ListTile(
            leading: const Icon(Icons.edit_notifications ),   
            title:  Text(text.notifications, style: textTheme.titleMedium,),
            subtitle:  Text(text.manageAllYourActiveNews,style: textTheme.bodySmall),
            onTap: () {
              
            }, 
          ),
          
        ],
      ) 
    ); 
  }
}