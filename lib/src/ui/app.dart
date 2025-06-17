import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:riversoft_test/src/ui/screens/splash_screen/splash_screen.dart';
import 'package:ui_kit/ui_kit.dart';

import 'screens/match_list_screen/match_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Matches',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.path: (BuildContext context) => const SplashScreen(),
        MatchListScreen.path: (BuildContext context) => const MatchListScreenProvider(),
      },
      onGenerateRoute: (RouteSettings settings) {
        // Use pattern matching to handle named routes
        return switch (settings.name) {
          SplashScreen.path => CupertinoPageRoute(builder: (context) => const SplashScreen(), settings: settings),
          MatchListScreen.path => CupertinoPageRoute(builder: (context) => const MatchListScreenProvider(), settings: settings),
          _ => null, // Handle other routes or return null for unhandled routes
        };
      },
    );
  }
}
