import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/core/utils/constants.dart';
import 'package:football/core/utils/time_ago.dart';
import 'package:football/features/news/data/models/transfers/transfer.dart';
import 'package:football/features/news/data/models/transfers/top_transfers.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopTransferWidget extends StatelessWidget {
  TopTransfers transfers;
  TopTransferWidget({super.key, required this.transfers});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    String language = getIt<TranslationsBloc>().state.language;

    return Container(
          height:280,
          width: double.infinity,
          color:Theme.of(context).colorScheme.surface,
         
          child: Stack( 
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), 
                      spreadRadius: 1, 
                      blurRadius: 2, 
                      offset: const Offset(0, 2),
                    ),
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),

                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row( 
                          children: [
                            const Icon(Icons.swap_horizontal_circle_outlined),
                            const Gap(5),
                            Text("TRANSFER",style: TextStyle(color: textTheme.headlineMedium!.color,fontSize: 16,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                            Text("CENTER",style: TextStyle(color: textTheme.headlineMedium!.color,fontSize: 16,fontStyle: FontStyle.italic)),
                            const Spacer(), 
                            const Icon(Icons.arrow_forward_ios_outlined,size: 15,)
                          ],
                        ),
                      ),
                      const Gap(20),
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
                        return const SizedBox(width: 15,);
                      }
                      Transfer transfer = transfers.transfers![index-1];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1), 
                              spreadRadius: 1, 
                              blurRadius: 2,
                              offset: const Offset(0, 2), 
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
                              const Gap(5),
                              Text(transfer.lastName!,style:textTheme.titleLarge ),
                              const Gap(5),
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
                                        const Gap(5),
                                        Icon(language=="English" ? CupertinoIcons.arrow_right_circle_fill :CupertinoIcons.arrow_left_circle_fill,color: Colors.green,size: 20 ,),
                                        const Gap(5),
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