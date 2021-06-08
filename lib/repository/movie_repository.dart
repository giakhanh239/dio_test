import 'package:dio/dio.dart';
import 'package:flutter_app_dio_test/model/movie.dart';
import 'package:flutter_app_dio_test/network/dio/movie_dio.dart';

abstract class IMovieRepository{
  Future<dynamic> getMovies(String path);
}

class MovieRepository extends IMovieRepository{
  DioMovie _dio;
  MovieRepository(){
    _dio=DioMovie();
  }
  @override
  Future<dynamic> getMovies(String path)async {
    List<Movie> movieList;
    var response;
    try{
      response = await _dio.get(path);
      if (response != null) {
        movieList = (response.data["results"] as List<dynamic>)
            ?.map((movieJson) => Movie.fromJson(movieJson))?.toList();
      } else {
        throw NullThrownError();
      }
      return movieList;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on NullThrownError catch(e){
      print("Movie list is null");
    }
  }


}