import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/core/utils/constants.dart';
import 'package:football/core/utils/time_ago.dart';
import 'package:football/features/news/data/models/news_models/news.dart';
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
      margin: const EdgeInsets.all(5), 
      decoration: BoxDecoration(  
        borderRadius: BorderRadius.circular(15), 
        // border: Border.all(width: 0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // رنگ سایه با شفافیت
            spreadRadius: 0.5, // میزان پخش شدن سایه
            blurRadius: 1, // میزان محو شدن سایه
            offset: const Offset(0, 2), // موقعیت سایه (x, y)
          ),
        ],
        color: Theme.of(context).colorScheme.primaryContainer,   
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          child: InkWell(
            splashColor: Colors.grey,
            onTap: () async {
              final website = Constants.website;
              final Uri url = Uri.parse('$website${news.page}');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Column(
              children: [
                SizedBox(
                  height: 145,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),
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
                          },
                          placeholderFadeInDuration: Duration.zero,
                          fadeInDuration: Duration.zero,
                          fadeOutDuration: Duration.zero,),
                        Container(
                            margin: const EdgeInsets.only(top: 5),
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
                      const Gap(8),
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
          ),
        ),
      ),
    );
  }
}