import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkTheme());

  void toggleTheme() {
    if (state is DarkTheme) {
      emit(LightTheme());
    } else {
      emit(DarkTheme());
    }
  }
}

abstract class ThemeState {}

class DarkTheme extends ThemeState {}

class LightTheme extends ThemeState {}
