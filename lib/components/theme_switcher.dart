import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/cubit/theme_cubit.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, theme) {
        return CupertinoSwitch(
          value: theme is DarkTheme,
          activeTrackColor: Colors.yellow[100],
          thumbColor: Colors.deepOrange[300],
          inactiveThumbColor: Colors.blueGrey[200],
          inactiveTrackColor: Colors.blueGrey,
          onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
        );
      },
    );
  }
}
