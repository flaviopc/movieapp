import 'package:flutter/cupertino.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  MovieController(this._moviesRepository) {
    fetch();
  }

  Movies? _cachedMovies;

  void fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovies
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }
}
