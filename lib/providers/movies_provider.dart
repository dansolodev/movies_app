import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '00c9b98fea02674969fcc3d58d3f0f05';
  String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider init');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '/3/movie/now_playing',
      {'api_key': _apiKey, 'language': _language, 'page': '1'},
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.body);
  }
}
