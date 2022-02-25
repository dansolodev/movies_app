import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() => runApp(AppState());

// https://www.themoviedb.org/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
          elevation: 0,
        ),
      ),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: CHANGE LAZY TO TRUE OR REMOVE PROPERTY.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => MoviesProvider(),
        ),
      ],
      child: MyApp(),
    );
  }
}
