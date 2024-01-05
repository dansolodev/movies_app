import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '00c9b98fea02674969fcc3d58d3f0f05';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovie = [];
  List<Movie> onPopularMovies = [];
  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String path, [int page = 1]) async {
    final url = Uri.https(
      _baseUrl,
      path,
      {'api_key': _apiKey, 'language': _language, 'page': '$page'},
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(jsonData);
    onDisplayMovie = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('/3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromRawJson(jsonData);
    onPopularMovies = [...onPopularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) {
      return moviesCast[movieId]!;
    }
    final jsonData = await _getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromRawJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(
      _baseUrl,
      '/3/search/movie',
      {'api_key': _apiKey, 'language': _language, 'query': query},
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final searchMoviesResponse =
        SearchMoviesResponse.fromRawJson(response.body);

    return searchMoviesResponse.results;
  }
}
