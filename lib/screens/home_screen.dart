import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_details.dart';
import '../data/movies.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> showMovies() {
    List<Movie> allMovies = [];
    List movies = MovieList.movies;

    for (var movie in movies) {
      allMovies.add(Movie.fromJson(movie));
    }
    return allMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
      ),
      body: ListView.builder(
        itemCount: showMovies().length,
        itemBuilder: (context, index) {
          Movie movie = showMovies()[index];
          return Card(
            elevation: 7,
            child: ListTile(
              title: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 23,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(
                      movie: movie,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
