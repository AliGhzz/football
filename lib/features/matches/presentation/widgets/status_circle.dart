import "package:flutter/material.dart";
import "package:football/features/matches/data/models/all_matches/status.dart";

Widget statusCircle(Status status, BuildContext context) {
  TextTheme textTheme = Theme.of(context).textTheme;
  if (status.liveTime != null && status.liveTime!.short == "HT") {
    return const CircleAvatar(
      maxRadius: 12,
      backgroundColor: Colors.green,
      child: Text(
        "HT",
        style: TextStyle(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  } else if (status.finished == true && status.reason != null) {
    return CircleAvatar(
      maxRadius: 12,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      child: Text(
        status.reason!.short.toString(),
        style: textTheme.displaySmall,
      ),
    );
  } else if (status.cancelled == true && status.reason != null) {
    return CircleAvatar(
      maxRadius: 12,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      child: Text(
        status.reason!.short.toString().substring(0, 2),
        style: textTheme.displaySmall,
      ),
    );
  } else if (status.ongoing == true) {
    return CircleAvatar(
      maxRadius: 12,
      backgroundColor: Colors.green,
      child: Text(
        status.liveTime!.short.toString().replaceFirst(
            status.liveTime!.short
                .toString()[status.liveTime!.short.toString().length - 1],
            ''),
        style: const TextStyle(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
  return const SizedBox.shrink();
}
