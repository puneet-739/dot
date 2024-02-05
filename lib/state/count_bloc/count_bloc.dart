import 'package:flutter_bloc/flutter_bloc.dart';
import 'count_event.dart';

class CountBloc extends Bloc<CountEvent, int> {
  CountBloc() : super(0) {
   on<CountIncrementEvent>((event, emit) => emit(state + 1));
   on<CountDecrementEvent>((event, emit) => emit(state - 1));
  }
}