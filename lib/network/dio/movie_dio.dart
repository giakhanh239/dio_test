import 'package:dio/dio.dart';
import 'package:flutter_app_dio_test/model/movie.dart';

const BASE_URL = "https://api.themoviedb.org/3/movie";
const API_KEY = "3f925dfbca61c1b1c073664033135564";

class DioMovie {
  Dio _dio;


  /// Initial
  /// - Parameters:
  ///   - opptions: The common config for the Dio instance.
  DioMovie() {
    _dio = Dio();
  }


  /// Method get
  /// - Parameters:
  ///   - path: url path
  ///   - data: body of http request
  /// - Return:
  ///   -A list of Movie
  ///
  dynamic getMovies(String path, {Map<String, dynamic> queryParam}) async {
    List<Movie> movieList;
    var response;
 try{
      response = await _dio.get(path);
      if (response != null) {
        movieList = (response.data["results"] as List<dynamic>)
            ?.map((movieJson) => Movie.fromJson(movieJson))?.toList();
      } else {
        movieList = new List.empty(growable: true);
      }

      return movieList;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
}


