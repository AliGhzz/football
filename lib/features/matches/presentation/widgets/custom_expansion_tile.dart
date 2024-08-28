import 'package:flutter/material.dart';
import 'package:football/core/utils/get_counries_fullname.dart';
import 'package:football/core/widgets/show_logo.dart';
import 'package:football/features/matches/data/models/leagues/league.dart';
import 'package:football/features/matches/presentation/widgets/status_circle.dart';
import 'package:football/features/matches/presentation/widgets/time_or_score.dart';
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
                const Gap(10),
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
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ) ,
            iconColor: Colors.white, 
            collapsedIconColor: Colors.white,    
            children: List.generate(
              widget.league.matches!.length,
              (index) {
                return SizedBox( 
                  height: 60, 
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right:5), 
                    child: Row(
                      children: [ 
                        Container(
                          width: double.infinity, 
                          child: Divider(
                            height: 1,
                            color: Colors.grey[300], // Set the color of the divider
                          ),
                        ),
                        Expanded(  
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [ 
                              const Gap(5),
                              statusCircle(widget.league.matches![index].status!),
                              Expanded(
                                child: Text(
                                  widget.league.matches![index].home!.name.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 0,),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2, 
                                  textAlign: TextAlign.end, 
                                ),
                              ),
                              const Gap(7),
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
                              const Gap(7),                              
                              Expanded( 
                                child: Text(
                                  widget.league.matches![index].away!.name.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 0,),
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
