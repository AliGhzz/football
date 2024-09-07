import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("nabayad rebuild beshe more");
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor:Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          toolbarHeight: 55,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0,10,0,0),
            child: Text(text.more),
          ),
          leadingWidth: 10,
          leading: Container(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.5), 
            child: Divider(color:Theme.of(context).tabBarTheme.dividerColor,thickness: 0.5,)
          ),
          actions: [ 
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,10,20,0
              ),
              child: CircleAvatar(
                radius: 15,
                child: Image.asset(
                  "assets/images/man.png",
                  height: 65,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                text.settings,
                style: textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const Gap(5),
            ListTile(
              leading: const Icon(
                Icons.swap_horizontal_circle,
                color: Color(0xff3bc3a2),
              ),
              title: Text(
                text.transferCenter,
                style: textTheme.titleMedium,
              ),
              onTap: () {},
            ),
            const Gap(5),
            ListTile(
              leading: const Icon(
                Icons.tv,
                color: Colors.grey,
              ),
              title: Text(
                text.tvSchedules,
                style: textTheme.titleMedium,
              ),
              subtitle: Text(text.franceGermany, style: textTheme.bodySmall),
              onTap: () {},
            ),
            const Gap(5),
            ListTile(
              leading: Image.asset(
                "assets/images/logo.png",
                height: 25,
                color: const Color(0xff60df6e),
              ),
              title: Text(
                text.fotmobSupportersClub,
                style: textTheme.titleMedium,
              ),
              subtitle: Text(text.removeAds, style: textTheme.bodySmall),
              onTap: () {},
            ),
            const Gap(5),
            ListTile(
              leading: const Icon(Icons.edit_notifications),
              title: Text(
                text.notifications,
                style: textTheme.titleMedium,
              ),
              subtitle: Text(text.manageAllYourActiveNews,
                  style: textTheme.bodySmall),
              onTap: () {},
            ),
          ],
        ));
  }
}
