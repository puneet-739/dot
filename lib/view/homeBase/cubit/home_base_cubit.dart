import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBaseCubit extends Cubit<int> {
  HomeBaseCubit(): super(0);

  void navigateTo(int index) {
    emit(index);
  }
}