import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/features/home/data/models/leagues/matches.dart';
import 'package:football/features/home/presentation/cubit/matches_cubit.dart';
import 'package:football/features/home/presentation/widgets/custom_expansion_tile.dart';

class MatchesTabContent extends StatelessWidget {
  final int dateOffset;
  const MatchesTabContent({super.key,required this.dateOffset});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesCubit, MatchesState>(
      builder: (context, state) {
        if (state is MatchesLoading) {
          return Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    BlocProvider.of<MatchesCubit>(context).getMatches();
                  },
                  child: const Text("Get Matches"),
                ),
                const CircularProgressIndicator(),
              ], 
            ),
          );
        } else if (state is MatchesLoaded) {
          Matches matches = state.matches;
          return ListView.builder(
            itemCount: matches.leagues!.length,
            itemBuilder: (context, index) {
              return CustomExpansionTile(league: matches.leagues![index]);
            },
          );
        } else {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<MatchesCubit>(context).getMatches();
                },
                child: const Text("Get Matches"),
              ),
              const Text("error",style: TextStyle(color: Colors.amber),),
            ],
          );
        }
      },
    );
  }
}
