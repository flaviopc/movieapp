import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../utils/apis_utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: movie.id,
                child: Image.network(
                  API.REQUEST_IMG(movie.posterPath),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return CircularProgressIndicator.adaptive();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              movie.overview,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  movie.originalTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  'Lançamento: ' + movie.releaseDate,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
