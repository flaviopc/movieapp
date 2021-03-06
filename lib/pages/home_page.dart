import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/decortors/movies_cache_repository_decorator.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import 'package:movieapp/services/dio_service_imp.dart';
import 'package:movieapp/utils/apis_utils.dart';
import 'package:movieapp/widgets/custom_list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImp(
        DioServiceImp(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return Visibility(
                      visible: movies != null,
                      child: Column(
                        children: [
                          Text("Movies",
                              style: Theme.of(context).textTheme.headline3),
                          const SizedBox(height: 10),
                          TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: const InputDecoration(
                                hintText: "Buscar...",
                                prefixIcon: Icon(Icons.search_outlined)),
                            onChanged: _controller.onChanged,
                          ),
                        ],
                      ),
                    );
                  }),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          separatorBuilder: (_, __) => Divider(),
                          itemBuilder: (_, idx) =>
                              CustomListCard(movie: movies.listMovies[idx]),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
