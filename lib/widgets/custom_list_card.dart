import 'package:flutter/material.dart';

import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/utils/apis_utils.dart';

class CustomListCard extends StatelessWidget {
  final Movie movie;
  const CustomListCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(API.REQUEST_IMG(movie.posterPath)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Spacer(),
                    Text("Popularidade: " + movie.popularity.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Votos: " + movie.voteAverage.toString()),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
