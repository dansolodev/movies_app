import 'package:flutter/material.dart';

import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProviders = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Películas en cines',
        ),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProviders.onDisplayMovie),
            MovieSlider(
              popularMovies: moviesProviders.onPopularMovies,
              headerSection: 'Populares!',
              onNextPage: () => moviesProviders.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
