import 'package:dot/state/count_bloc/count_event.dart';
import 'package:dot/state/count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/count_bloc/count_bloc.dart';

class GameMania extends StatelessWidget {
  GameMania({super.key});
  final countCubit = CountCubit();
  final countCubitBloc = CountBloc();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder(
            bloc: countCubitBloc,
              builder: (BuildContext context, int state) {
            return Text(state.toString());
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                countCubitBloc.add(CountDecrementEvent());
                // countCubit.decrement();
              }, child: const Text('-')),
              ElevatedButton(onPressed: () {
                // countCubit.increment();
                countCubitBloc.add(CountIncrementEvent());
              }, child: const Text('+')),
            ],
          )
        ],
      ),
    );
  }
}