import 'package:flutter/material.dart';
import 'package:football/core/utils/get_counries_fullname.dart';
import 'package:football/core/widgets/show_logo.dart';
import 'package:football/features/matches/data/models/all_matches/league.dart';
import 'package:football/features/matches/presentation/widgets/status_circle.dart';
import 'package:football/features/matches/presentation/widgets/time_or_score.dart';
import 'package:gap/gap.dart';

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
              title: Row(
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
                  return SizedBox(
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
                  );
                },
              )),
        ),
      ),
    );
  }
}
