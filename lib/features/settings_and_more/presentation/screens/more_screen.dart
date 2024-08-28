import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF262626),
        toolbarHeight: 45, 
        leading: const Padding(
          padding: EdgeInsets.all(8.0), 
          child: Text("More",style: TextStyle(fontFamily: "GTWalsheim",fontSize: 18,color: Colors.white),),
        ), 
        leadingWidth: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            leading: const Icon(Icons.swap_horizontal_circle,color: Color(0xff3bc3a2),size: 22,), 
            title: const Text("Transfer Center", style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            },
          ),
          const Gap(5),
           ListTile(
            leading: const Icon(Icons.tv  ,color: Colors.grey ,size: 20,),  
            title: const Text("TV schedules", style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            subtitle: const Text("France, Germany, Middle East, Spain, United Kingdom",style: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            },
          ),
          const Gap(5),
          ListTile(
            leading: Image.asset("assets/images/logo.png",height:20,color: const Color(0xff60df6e) ,), 
            title: const Text("FotMob Supporters Club", style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            subtitle: const Text("Remove ads",style: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            },
          ),
          const Gap(5),
          ListTile(
            leading: const Icon(Icons.edit_notifications ,color: Colors.white,size: 23,),   
            title: const Text("Notifications", style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            subtitle: const Text("Manage all your active news, team, player and league notifications",style: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              
            }, 
          ),
          const Gap(5),
          ListTile(
            leading: const Icon(Icons.settings,color: Colors.white,size: 22,), 
            title: const Text("Settings", style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w300, letterSpacing: 0),),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ) 
    ); 
  }
}