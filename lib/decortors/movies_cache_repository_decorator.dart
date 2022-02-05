import 'dart:convert';

import 'package:movieapp/decortors/movies_repository_decorator.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(movies);
    prefs.setString('movies_cache', json);
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var movies = prefs.getString('movies_cache')!;
    var json = jsonDecode(movies);
    return Movies.fromJson(json);
  }
}
