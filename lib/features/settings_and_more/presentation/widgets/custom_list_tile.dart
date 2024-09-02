import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/config/languages/bloc/translations_bloc.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? image;
  final double? height;
  final VoidCallback? onTap;
  const CustomListTile(
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
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
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
                      )
                    : Image.asset(
                        image!,
                        height: 25,
                        color: Colors.white,
                      ),
                title: Text(
                  title,
                  style: textTheme.titleMedium
                ),
                subtitle: subtitle != null
                    ? Text(
                        subtitle!,
                        style: textTheme.bodySmall,
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
