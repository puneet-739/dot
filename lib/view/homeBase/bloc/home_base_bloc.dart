import 'package:dot/view/homeBase/bloc/home_base_event.dart';
import 'package:dot/view/homeBase/bloc/home_base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBaseBloc extends Bloc<HomeBaseEvent, HomeBaseState> {
  HomeBaseBloc(): super(HomeBaseState.home) {
   on<HomePressed>((event, emit) => emit(HomeBaseState.home));
   on<ChatPressed>((event, emit) => emit(HomeBaseState.chat));
   on<GamePressed>((event, emit) => emit(HomeBaseState.game));
   on<ProfilePressed>((event, emit) => emit(HomeBaseState.profile));
  }
}