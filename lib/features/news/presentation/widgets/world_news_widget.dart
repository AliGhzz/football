import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/core/utils/constants.dart';
import 'package:football/core/utils/time_ago.dart';
import 'package:football/features/news/data/models/news.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';


class WorldNewsWidget extends StatelessWidget {
  News news;
  WorldNewsWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 220,
      width: 250, 
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,   
      ),
      
      child: Column(
        children: [
          SizedBox(
            height: 145 ,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,  
                    imageUrl: "${news.imageUrl}",
                    placeholder: (context, url) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 103, 102, 102),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 103, 102, 102), 
                      );
                    }),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      // color: Colors.red,
                      child: Image.network(
                        "https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",
                        height: 15,
                        width: 35,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
              child: Text(
                news.title!,
                style:  textTheme.displayMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ), 
          Padding(
            padding: const EdgeInsetsDirectional.only(start:10.0,bottom: 5),  
            child: Row(  
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  "https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",
                  height: 10,
                ),
                Gap(8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child:
                      Text("${news.source!} - ", style: textTheme.titleSmall),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    timeAgo(news.gmtTime!),
                    style: textTheme.titleSmall,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}