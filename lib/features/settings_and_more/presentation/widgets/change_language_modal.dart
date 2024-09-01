import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/features/settings_and_more/presentation/bloc/translations_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void changeLanguageModal(BuildContext context, int selectedItem){
  AppLocalizations text = AppLocalizations.of(context)!;
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 300,
            width: double.infinity,
            // padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  height: 4, // height of the line
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
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text("Theme",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                    const Divider(
                      thickness: 0.1,
                      color: Colors.white,
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: RadioListTile<int>(
                        title: Text(
                          text.persian,
                          style: const TextStyle(color: Colors.white),
                        ),
                        value: 1,
                        groupValue: selectedItem,
                        onChanged: (int? value) {
                          Navigator.pop(context);
                          // Future.delayed(Duration(milliseconds: 500)).then((value){
                          BlocProvider.of<TranslationsBloc>(context).add(TranslationsEvent("fa"));
                          // });
                        },
                        contentPadding: EdgeInsets.zero,
                        activeColor: const Color(0xff60de6e),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: RadioListTile<int>(
                        title:  Text(
                          text.english,
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 2,
                        groupValue: selectedItem,
                        onChanged: (int? value) {
                          Navigator.pop(context);
                          // Future.delayed(Duration(milliseconds: 500)).then((value){
                          BlocProvider.of<TranslationsBloc>(context).add(TranslationsEvent("en"));
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