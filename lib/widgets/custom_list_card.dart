import 'package:flutter/material.dart';

import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/pages/details_page.dart';
import 'package:movieapp/utils/apis_utils.dart';

class CustomListCard extends StatelessWidget {
  final Movie movie;
  const CustomListCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(movie: movie),
                fullscreenDialog: true),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              ),
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
                        const Spacer(),
                        Text("Popularidade: " + movie.popularity.toString()),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Votos: " + movie.voteAverage.toString()),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
