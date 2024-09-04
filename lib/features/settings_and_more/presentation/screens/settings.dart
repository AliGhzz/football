import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:football/config/themes/cubit/theme_switcher_cubit.dart';
import 'package:football/features/settings_and_more/presentation/widgets/change_language_modal.dart';
import 'package:football/features/settings_and_more/presentation/widgets/change_theme_modal.dart';
import 'package:football/features/settings_and_more/presentation/widgets/custom_list_tile.dart';
import 'package:gap/gap.dart';
import 'package:football/core/utils/app_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 55,
          titleSpacing: 0,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 15, end: 10, top: 2),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                icon: Icon(
                  isRtl
                      ? CupertinoIcons.arrow_right
                      : CupertinoIcons.arrow_left,
                )),
          ),
          title: Text(
            text.settings,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 8, right: 8),
          children: [
            const Gap(8),
            BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
              builder: (context, state) {
                return CustomListTile(
                    title: text.theme,
                    subtitle: state.theme,
                    icon: Icons.nightlight,
                    onTap: () {
                      changeThemeModal(context,
                          context.read<ThemeSwitcherCubit>().state.themeIndex);
                    });
              },
            ),
            const Gap(8),
            BlocBuilder<TranslationsBloc, TranslationsState>(
              builder: (context, state) {
                return CustomListTile(
                    title: text.selectTheInterfaceLanguage,
                    subtitle: state.language,
                    icon: Icons.language,
                    onTap: () {
                      changeLanguageModal(context,
                          context.read<TranslationsBloc>().state.languageIndex);
                    });
              },
            ),
            const Gap(8),
            CustomListTile(
              title: text.currency,
              subtitle: text.usDollar,
              icon: Icons.attach_money,
            ),
            const Gap(8),
            CustomListTile(
              title: text.measurementSystem,
              subtitle: text.metric,
              icon: Icons.straighten,
            ),
            const Gap(8),
            CustomListTile(
              title: text.oddsFormat,
              subtitle: "3.5",
              icon: CupertinoIcons.chart_bar,
            ),
            const Gap(8),
            ListTile(
              leading: Text(text.others, style: textTheme.headlineMedium),
            ),
            const Gap(8),
            CustomListTile(
              title: text.shareFotmob,
              icon: Icons.share,
              height: 60,
            ),
            const Gap(8),
            CustomListTile(
              title: text.followUs,
              icon: Icons.person_add_alt_sharp,
              height: 60,
            ),
            const Gap(8),
            CustomListTile(
              title: text.tipsAndSupport,
              icon: Icons.question_mark_sharp,
              height: 60,
            ),
            const Gap(8),
            CustomListTile(
              title: text.privacyPolicy,
              icon: CupertinoIcons.lock_shield_fill,
              height: 60,
            ),
            const Gap(8),
            CustomListTile(
                title: text.appVersion,
                subtitle: AppInfo.version,
                image: "assets/images/logo.png"),
            const Gap(80)
          ],
        ));
  }
}
