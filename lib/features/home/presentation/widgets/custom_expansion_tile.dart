import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football/core/utils/get_converted_time.dart';
import 'package:football/core/utils/get_counries_fullname.dart';
import 'package:football/core/widgets/show_logo.dart';
import 'package:football/features/home/data/models/leagues/league.dart';
import 'package:football/features/home/presentation/widgets/status_circle.dart';
import 'package:football/features/home/presentation/widgets/time_or_score.dart';
import 'package:gap/gap.dart';
class CustomExpansionTile extends StatefulWidget {
  final League league;
  const CustomExpansionTile({super.key, 
    required this.league,
  });
  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF262626),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, 
          ),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Row(
              children: [
                widget.league.ccode == "INT"
                    ? SizedBox(
                        height: 15,
                        width: 15,
                        child: ShowLogo.getLogoOfInternationalTournament(widget.league.primaryId.toString()),
                      )
                    : SizedBox(
                        height: 15,
                        width: 15,
                        child: ShowLogo.getLogoOfCountryLeagues(widget.league.ccode!.toLowerCase()),
                      ),
                Gap(10),
                Expanded( 
                  child: Text(
                    "${widget.league.ccode != "INT" ? getCountriesFullname(widget.league.ccode!.toUpperCase()) : ""}${widget.league.ccode == "INT" ? "" : " - "}${widget.league.name.toString()}",
                    style: const TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 0, fontWeight: FontWeight.w500),
                    softWrap: true,
                    maxLines: null,
                  ), 
                ),
              ],
            ),

            iconColor: Colors.white, 
            
            children: List.generate(
              widget.league.matches!.length,
              (index) {
                return Container( 
                  height: 60, 
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right:5), 
                    child: Row(
                      children: [ 
                        Expanded(  
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [ 
                              Gap(5),
                              statusCircle(widget.league.matches![index].status!),
                              Expanded(
                                child: Text(
                                  widget.league.matches![index].home!.name.toString(),
                                  style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 0,),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2, 
                                  textAlign: TextAlign.end, 
                                ),
                              ),
                              Gap(7),
                              SizedBox(
                                height: 23,
                                child: ShowLogo.getLogoOfTeam(widget.league.matches![index].home!.id.toString()),
                              ),
                            ],
                          ),
                        ),
                        timeOrScore(widget.league.matches![index].status!),
                        Expanded( 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 23, 
                                child: ShowLogo.getLogoOfTeam(widget.league.matches![index].away!.id.toString()),
                              ),
                              Gap(7),                              
                              Expanded( 
                                child: Text(
                                  widget.league.matches![index].away!.name.toString(),
                                  style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 0,),
                                  overflow: TextOverflow.ellipsis, 
                                  maxLines: 2, 
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
