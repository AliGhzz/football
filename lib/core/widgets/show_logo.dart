import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowLogo {
  static Widget getLogoOfCountryLeagues(String id) {
    return CachedNetworkImage(
        imageUrl:
            "https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fteamlogo%2F$id.png&w=48&q=75",
        placeholder: (context, url) {
          return const SizedBox(
            height: 15,
            width: 15,
          );
        },
        errorWidget: (context, url, error) {
          return SizedBox(
            height: 15,
            width: 15,
            child: Image.asset("assets/images/shield.png"),
          );
        });
  }

  static Widget getLogoOfInternationalTournament(String id) {
    return CachedNetworkImage(
      imageUrl:
          "https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fleaguelogo%2Fdark%2F$id.png&w=48&q=75",
      placeholder: (context, url) {
        return const SizedBox(
          height: 15,
          width: 15,
        );
      },
      errorWidget: (context, url, error) {
        return SizedBox(
          height: 15,
          width: 15,
          child: Image.asset("assets/images/shield.png"),
        );
      },
    );
  }

  static Widget getLogoOfTeam(String id) {
    return CachedNetworkImage(
      imageUrl:
          "https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fteamlogo%2F${id}_xsmall.png&w=48&q=10",
      placeholder: (context, url) {
        return const SizedBox(
          height: 23,
          width: 23,
        );
      },
      errorWidget: (context, url, error) {
        return SizedBox(
          height: 23,
          width: 23,
          child: Image.asset("assets/images/shield.png"),
        );
      },
    );
  }
}
