import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageCubit extends Cubit<int> {
  MainPageCubit() : super(0);

  void setIndex(int index) => emit(index);
}