import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/router/app_routes.dart';
import 'package:movies_app/themes/movies_app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MoviesAppState());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      initialRoute: MoviesAppRoutes.initalRoute,
      routes: MoviesAppRoutes.getAppRoutes(),
      theme: MoviesAppTheme.lightTheme,
    );
  }
}

class MoviesAppState extends StatelessWidget {
  const MoviesAppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}
