import 'package:flutter/material.dart';
import 'package:movies_app/router/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      initialRoute: MoviesAppRoutes.initalRoute,
      routes: MoviesAppRoutes.getAppRoutes(),
    );
  }
}
