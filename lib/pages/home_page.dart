import 'package:flutter/material.dart';
import 'package:movieapp/controllers/movie_controller.dart';
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
  final MovieController _controller =
      MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Movies", style: Theme.of(context).textTheme.headline3),
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
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
