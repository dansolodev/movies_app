import 'package:flutter/material.dart';
import 'package:movies_app/screens/screens.dart';

class MoviesAppRoutes {
  static const initalRoute = 'home';
  static const detailRoute = 'details';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll(
      {
        initalRoute: (context) => const HomeScreen(),
        'details': (context) => const DetailsScreen()
      },
    );
    return appRoutes;
  }
}
