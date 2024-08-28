import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? image;
  final double? height;
  const CustomListTile({super.key, required this.title, this.subtitle, this.icon, this.image,this.height});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF262626),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey.withOpacity(0.3),
          child: ListTile(
            onTap: () {
              
            },
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ) ,
            
            leading:icon != null ? Icon(
              icon,
              color: Colors.white,
              size: 20, 
            ) : Image.asset(image!,height:20,color: Colors.white ,),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                letterSpacing: 0,
              ),
            ),
            subtitle:subtitle!=null ? Text(
              subtitle!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                letterSpacing: 0,
              ),
            ): null,
          ),
        ),
      ),
    );
  }
}