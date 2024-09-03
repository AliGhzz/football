import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football/core/utils/time_ago.dart';
import 'package:football/features/news/data/models/news.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';

class NewsWidget extends StatelessWidget {
  News news ;
  int index ;
  bool isBig ;
  NewsWidget({super.key,required this.news,required this.index , required this.isBig});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    print("https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png");
    if(isBig){
      return Container(
        height:300,
        width: double.infinity, 
        padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Stack( 
              alignment: Alignment.topRight, 
              children: [
                
                Container(
                  height: 200,
                  width: double.infinity,
                  // color: Colors.amber[100*index], 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20) ,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover , 
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
                          color: const Color.fromARGB(255, 103, 102, 102) ,
                        );
                      }
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10 ),
                  // color: Colors.red, 
                  child: Image.network("https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",height: 20,width: 50,),
                ), 
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0), 
              child: Text(news.title!), 
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center ,
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                Image.network("https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",height: 10,),
                Gap(8), 
                Padding(
                  padding: const EdgeInsets.only(bottom:4.0 ),
                  child: Text("${news.source!} - ", style:textTheme.titleSmall),
                ),
                Padding(
                  padding:  const EdgeInsets.only(bottom:4.0 ),
                  child: Text(timeAgo(news.gmtTime!),style:textTheme.titleSmall ,),
                )
              ], 
            )
          ],
        ),
      );
    }else{
      return Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 90,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                          fit: BoxFit.cover , 
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
                              color: const Color.fromARGB(255, 103, 102, 102) ,
                            );
                          }
                        ),
                  ),
                ),
                Container( 
                  margin: EdgeInsets.only(top:5),
                  // color: Colors.red,  
                  child: Image.network("https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",height: 10,width: 20,),
                ), 
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10), 
                    child: Text(news.title!,style: textTheme.displayMedium ,), 
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center ,
                    mainAxisAlignment: MainAxisAlignment.start ,
                    children: [
                      Gap(10),
                      Image.network("https://images.fotmob.com/image_resources/news/${news.sourceStr!.toLowerCase()}.png",height: 10,),
                      Gap(8), 
                      Padding(
                        padding: const EdgeInsets.only(bottom:4.0 ),
                        child: Text("${news.source!} - ", style:textTheme.titleSmall),
                      ),
                      Padding(
                        padding:  const EdgeInsets.only(bottom:4.0 ),
                        child: Text(timeAgo(news.gmtTime!),style:textTheme.titleSmall ,),
                      )
                    ], 
                  )
                ],
              )
            ),
          ],
        ),
      );
    }
    
  }
}