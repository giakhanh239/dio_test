import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_dio_test/model/movie.dart';

class DetailMovie extends StatelessWidget {
  final Movie movie;
  DetailMovie({@required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                movie.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
                child: Container(
                    height: 300,
                    width: 300,
                    child:CachedNetworkImage(
                      imageUrl:"https://image.tmdb.org/t/p/original/${movie.posterPath}",
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                )
            ),
            Text(movie.releaseDate),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(movie.overview),
            ),
            Text(movie.voteAverage.toString())
          ],
        ),
      ),
    );
  }
}
