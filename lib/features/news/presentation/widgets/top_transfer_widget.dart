import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football/core/utils/constants.dart';
import 'package:football/core/utils/time_ago.dart';
import 'package:football/features/news/data/models/transfers/transfer.dart';
import 'package:football/features/news/data/models/transfers/transfers.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopTransferWidget extends StatelessWidget {
  Transfers transfers;
  TopTransferWidget({super.key, required this.transfers});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
          height:280,
          width: double.infinity,
          color:Theme.of(context).colorScheme.surface,
         
          child: Stack( 
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // رنگ سایه با شفافیت
                      spreadRadius: 1, // میزان پخش شدن سایه
                      blurRadius: 2, // میزان محو شدن سایه
                      offset: const Offset(0, 2), // موقعیت سایه (x, y)
                    ),
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),

                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                      Row( 
                        children: [
                          Icon(Icons.swap_horizontal_circle_outlined),
                          Gap(5),
                          Text(text.transfer.toUpperCase(),style: TextStyle(color: textTheme.headlineMedium!.color,fontSize: 16,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          Text(" ${text.center.toUpperCase()}",style: TextStyle(color: textTheme.headlineMedium!.color,fontSize: 16,fontStyle: FontStyle.italic)),
                          Spacer(), 
                          Icon(Icons.arrow_forward_ios_outlined,size: 15,)
                        ],
                      ),
                      Gap(20),
                      Text(text.topTransfers,style: textTheme.bodyLarge),
                    ],
                  ),
                ),
              ) ,
              Padding(
                padding: const EdgeInsets.only(bottom:15),
                child: SizedBox(
                  height: 150,
                  width: double.infinity, 
                  child: ListView.builder(
                    itemCount: transfers.transfers!.length > 6? 7 : transfers.transfers!.length, 
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) { 
                      
                      if(index==0 || index==(transfers.transfers!.length > 6 ? 6  : transfers.transfers!.length-1)){
                        return SizedBox(width: 15,);
                      }
                      Transfer transfer = transfers.transfers![index-1];
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1), // رنگ سایه با شفافیت
                              spreadRadius: 1, // میزان پخش شدن سایه
                              blurRadius: 2, // میزان محو شدن سایه
                              offset: const Offset(0, 2), // موقعیت سایه (x, y)
                            ),
                          ]
                        ),
                        // height: 40, 
                        width: 220, 
                        child: InkWell(
                          onTap: () async {
                            final website = Constants.website;
                            final Uri url = Uri.parse('$website/players/${transfer.playerId}/${transfer.fullName}');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(transfer.firstName!,style: textTheme.bodyMedium),
                                  Text(timeAgo(transfer.transferDate!),style: textTheme.bodySmall)
                                ],
                              ),
                              Gap(5),
                              Text(transfer.lastName!,style:textTheme.titleLarge ),
                              Gap(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Row(
                                      children: [
                                        
                                        SizedBox(
                                          height: 25,
                                          width: 25, 
                                          child: CachedNetworkImage(
                                            imageUrl: "https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fteamlogo%2F${transfer.fromClubId}_xsmall.png&w=48&q=75",
                                            errorWidget: (context, url, error) {
                                              return Image.asset("assets/images/shield.png",color: Colors.amber,);
                                            },
                                            placeholder: (context, url) {
                                              return Image.asset("assets/images/shield.png",color: Colors.amber,);
                                            },
                                            placeholderFadeInDuration: Duration.zero,
                                            fadeInDuration: Duration.zero,
                                            fadeOutDuration: Duration.zero,
                                          ),
                                        ),
                                        Gap(5),
                                        Icon(CupertinoIcons.arrow_right_circle_fill,color: Colors.green,size: 20 ,),
                                        Gap(5),
                                        SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CachedNetworkImage(
                                            imageUrl: "https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Flogo%2Fteamlogo%2F${transfer.toClubId}_xsmall.png&w=48&q=75",
                                            errorWidget: (context, url, error) {
                                              return Image.asset("assets/images/shield.png",color: Colors.amber,);
                                            },
                                            placeholder: (context, url) {
                                              return Image.asset("assets/images/shield.png",color: Colors.amber,);
                                            },
                                            placeholderFadeInDuration: Duration.zero,
                                            fadeInDuration: Duration.zero,
                                            fadeOutDuration: Duration.zero,
                                          ),
                                        ),
                                      ],
                                    ),
                          
                                  ),
                                  SizedBox(
                                    height: 67,
                                    width: 67,
                                    child: CachedNetworkImage( 
                                      fadeInDuration: Duration.zero,
                                      fadeOutDuration: Duration.zero,
                                      imageUrl: "https://www.fotmob.com/_next/image?url=https%3A%2F%2Fimages.fotmob.com%2Fimage_resources%2Fplayerimages%2F${transfer.playerId}.png&w=96&q=75"
                                    ),
                                  ),
                          
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
  }
}