import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/features/settings_and_more/presentation/bloc/translations_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? image;
  final double? height;
  final VoidCallback? onTap;
  CustomListTile(
      {super.key,
      required this.title,
      this.subtitle,
      this.icon,
      this.image,
      this.height,
      this.onTap,
      });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1d1d1d),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey.withOpacity(0.3),
          child: BlocBuilder<TranslationsBloc, TranslationsState>(
            builder: (context, state) {
              return ListTile(
                onTap: onTap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: icon != null
                    ? Icon(
                        icon,
                        color: Colors.white,
                        size: 25,
                      )
                    : Image.asset(
                        image!,
                        height: 25,
                        color: Colors.white,
                      ),
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0,
                  ),
                ),
                subtitle: subtitle != null
                    ? Text(
                        subtitle!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0,
                        ),
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
