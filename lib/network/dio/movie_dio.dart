import 'package:dio/dio.dart';
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
  dynamic get(String path, {Map<String, dynamic> queryParam}) async {
    return await _dio.get(path, queryParameters: queryParam);
  }
}


