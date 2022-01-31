import 'package:flutter/cupertino.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  MovieController(this._moviesRepository) {
    fetch();
  }

  void fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
