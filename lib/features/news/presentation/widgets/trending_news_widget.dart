import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football/core/utils/constants.dart';
import 'package:football/core/utils/time_ago.dart';
import 'package:football/features/news/data/models/news.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class TrendingNewsWidget extends StatelessWidget {
  News news;
  bool isBig;
  TrendingNewsWidget(
      {super.key,
      required this.news,
      required this.isBig});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    if (isBig) {
      return InkWell(
        splashColor: Colors.grey,
        onTap: () async {
          final website = Constants.website;
          final Uri url = Uri.parse('${website}${news.page}');
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        child: Container(
          height: 295,
          width: double.infinity,
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
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
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // color: Colors.red,
                    child: Image.network(
                      "https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",
                      height: 20,
                      width: 50,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    news.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              Row(
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
              )
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        splashColor: Colors.grey,
        onTap: () async {
          final website = Constants.website;
          final Uri url = Uri.parse('${website}${news.page}');
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        child: Container(
          height: 110,
          width: double.infinity,
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 85,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
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
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    // color: Colors.red,
                    child: Image.network(
                      "https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",
                      height: 10,
                      width: 25,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      news.title!,
                      style: textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(10),
                      Image.network(
                        "https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",
                        height: 10,
                      ),
                      Gap(8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text("${news.source!} - ",
                            style: textTheme.titleSmall),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          timeAgo(news.gmtTime!),
                          style: textTheme.titleSmall,
                        ),
                      )
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      );
    }
  }
}
