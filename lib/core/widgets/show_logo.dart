import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowLogo {
  static Widget getLogoOfCountryLeagues(String id){
    return Image.network("https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fteamlogo%2F$id.png&w=48&q=75", 
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return SizedBox(
            height: 17,
            child: Image.asset("assets/images/shield.png"),
          );
        } 
      },
      
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: 17, 
          child: Image.asset("assets/images/shield.png"),
        ); 
      },
    );
  }
  static Widget getLogoOfInternationalTournament(String id){
    return Image.network("https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fleaguelogo%2Fdark%2F$id.png&w=48&q=75", 
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; 
        } else {
          return SizedBox(
            height: 17,
            child: Image.asset("assets/images/shield.png"),
          );
        } 
        
      },
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: 17,
          child: Image.asset("assets/images/shield.png"),
        );
      },
    );
  }
  static Widget getLogoOfTeam(String id){
    return Image.network("https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fteamlogo%2F${id}_xsmall.png&w=48&q=10", 
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return SizedBox(
            height: 17,
            child: Image.asset("assets/images/shield.png"),
          );
        }  
      },
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: 17,
          child: Image.asset("assets/images/shield.png"),
        );
      },
    );
  }
} 