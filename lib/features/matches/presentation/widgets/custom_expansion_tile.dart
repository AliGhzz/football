import 'package:flutter/material.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/core/utils/constants.dart';
import 'package:football/core/utils/get_counries_fullname.dart';
import 'package:football/features/leagues/presentation/cubit/leagues_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:football/features/settings_and_more/presentation/widgets/show_logo.dart';
import 'package:football/features/matches/data/models/all_matches/league.dart';
import 'package:football/features/matches/presentation/widgets/status_circle.dart';
import 'package:football/features/matches/presentation/widgets/time_or_score.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomExpansionTile extends StatefulWidget {
  final League league;
  const CustomExpansionTile({
    super.key,
    required this.league,
  });
  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
          
              initiallyExpanded: true,
              title: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,   
                focusColor: Colors.transparent,
                onTap: () async {
                  String? leagueUrl =await getIt<LeaguesCubit>().getLeagueDetails(leagueId: widget.league.primaryId!);
              
                  if(leagueUrl != null){
                    final Uri url = Uri.parse(leagueUrl);
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  }
                },
                
                child: Row(
                  children: [
                    widget.league.ccode == "INT"
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: ShowLogo.getLogoOfInternationalTournament(
                                widget.league.primaryId.toString()),
                          )
                        : SizedBox(
                            height: 15,
                            width: 15,
                            child: ShowLogo.getLogoOfCountryLeagues(
                                widget.league.ccode!.toLowerCase()),
                          ),
                    const Gap(10),
                    Expanded(
                      child: Text(
                        "${widget.league.ccode != "INT" ? getCountriesFullname(widget.league.ccode!.toUpperCase()) : ""}${widget.league.ccode == "INT" ? "" : " - "}${widget.league.name.toString()}",
                        style: textTheme.bodyMedium,
                        softWrap: true,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              children: List.generate(
                widget.league.matches!.length + 1,
                (index) {
                  if (index == 0) {
                    return const SizedBox(
                      width: double.infinity,
                      child: Divider(
                        thickness: 1,
                        height: 1,
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () async {
                      String? matchUrl =await getIt<MatchesCubit>().getMatcheDetails(matchId: widget.league.matches![index - 1].id!);
                      if(matchUrl != null){
                        final website = Constants.website;
                        final Uri url = Uri.parse('$website$matchUrl');
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      }
                    },
                    child: SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Gap(5),
                                  statusCircle(
                                      widget.league.matches![index - 1].status!,
                                      context),
                                  Expanded(
                                    child: Text(
                                      widget.league.matches![index - 1].home!.name
                                          .toString(),
                                      style: textTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  const Gap(7),
                                  SizedBox(
                                    height: 23,
                                    child: ShowLogo.getLogoOfTeam(widget
                                        .league.matches![index - 1].home!.id
                                        .toString()),
                                  ),
                                ],
                              ),
                            ),
                            timeOrScore(widget.league.matches![index - 1].status!,
                                context),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 23,
                                    child: ShowLogo.getLogoOfTeam(widget
                                        .league.matches![index - 1].away!.id
                                        .toString()),
                                  ),
                                  const Gap(7),
                                  Expanded(
                                    child: Text(
                                      widget.league.matches![index - 1].away!.name
                                          .toString(),
                                      style: textTheme.bodyMedium,
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
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
