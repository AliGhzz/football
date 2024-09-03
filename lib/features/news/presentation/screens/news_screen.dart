import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football/features/news/presentation/cubit/news_cubit.dart';
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations text = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(text.news),
            ElevatedButton(onPressed: (){
              BlocProvider.of<NewsCubit>(context).getNews();
            }, child: Text("get latest news",style: textTheme.bodyMedium,))
          ],
        ),
      ),
    );
  }
}