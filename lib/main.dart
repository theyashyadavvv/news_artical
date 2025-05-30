import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_buzz/cubit/news_feed_cubit.dart';
import 'package:news_buzz/cubit/theme_cubit.dart';
import 'package:news_buzz/cubit/bookmark_cubit.dart'; // <-- Add this import
import 'package:news_buzz/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => NewsFeedCubit()),
        BlocProvider(create: (_) => BookmarkCubit()), // <-- Add BookmarkCubit
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, theme) {
        return MaterialApp(
          title: "NewsBuzz X AiBuzz",
          theme: theme is DarkTheme ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      },
    );
  }
}

//TODO:
//* LoginPage
// Email & Password fields Login button ✅
// Basic validation (e.g., required fields, valid email format) ✅
// Simple authentication (no backend needed, just navigate to news page after login) ✅

//* News Feed Page
// Fetch news articles from a public API (NewsApi) ✅
// Display news in a list format with :
//     Headline ✅
//     Thumbnail Image ✅
//     Short Description ✅
//     Source Name ✅
//     Published Date ✅
// On click of item open full article in WebView ✅

//* Tech Stack
// Flutter (latest stable version) [3.29.0] ✅
// http package for API calls ✅
// Provider or Riverpod for state management(optional) [Used BLoC with Cubit]  
// webview_flutter package to open full article in WebView ✅
//* Bonus (Optional Enhancements):
//     Implement dark mode ✅
//     Add pull to refresh functionality ✅
//     Use a search bar to filter news ✅