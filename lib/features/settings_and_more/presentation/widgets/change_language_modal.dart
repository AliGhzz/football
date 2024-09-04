import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void changeLanguageModal(BuildContext context, int selectedItem) {
  AppLocalizations text = AppLocalizations.of(context)!;
  TextTheme textTheme = Theme.of(context).textTheme;
  showModalBottomSheet(
    constraints: BoxConstraints(maxWidth: double.infinity),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Color(0xFF262626),
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(20, 15),
                  topRight: Radius.elliptical(20, 15)),
            ),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 40,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 10),
                        child: Text(text.selectTheInterfaceLanguage,
                            style: textTheme.titleLarge),
                      ),
                    ),
                    const Divider(
                      thickness: 0.1,
                      color: Colors.grey,
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: RadioListTile<int>(
                        title: Text(text.persian, style: textTheme.bodyLarge),
                        value: 1,
                        groupValue: selectedItem,
                        onChanged: (int? value) {
                          Navigator.pop(context);
                          // Future.delayed(Duration(milliseconds: 500)).then((value){
                          if (selectedItem != value) {
                            BlocProvider.of<TranslationsBloc>(context)
                                .add(TranslationsEvent("fa"));
                          }
                          // });
                        },
                        contentPadding: EdgeInsets.zero,
                        activeColor: const Color(0xff60de6e),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: RadioListTile<int>(
                        title: Text(text.english, style: textTheme.bodyLarge),
                        value: 2,
                        groupValue: selectedItem,
                        onChanged: (int? value) {
                          Navigator.pop(context);
                          // Future.delayed(Duration(milliseconds: 500)).then((value){
                          if (selectedItem != value) {
                            BlocProvider.of<TranslationsBloc>(context)
                                .add(TranslationsEvent("en"));
                          }

                          // });
                        },
                        contentPadding: EdgeInsets.zero,
                        activeColor: const Color(0xff60de6e),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    },
  );
}
