import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieDetails extends StatelessWidget {
  Movie movie;
  MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: CarouselSlider(
              items: movie.images
                  .map((image) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Text(
            "Director: ${movie.director}",
            style: TextStyle(
              fontSize: 23,
            ),
          )
        ],
      ),
    );
  }
}
