
import 'package:flutter_app_dio_test/model/movie.dart';
import 'package:flutter_app_dio_test/network/dio/movie_dio.dart';
import 'package:flutter_app_dio_test/repository/movie_repository.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  var itemList=List<Movie>.empty(growable: true).obs;
  var pageNumber=1;
  MovieRepository _repository=new MovieRepository();

  /// init
  @override
  void onInit() {
    // TODO: implement onInit
    ///get data for the list
   getNewMovieList();
    super.onInit();
  }

  /// get Data form API
  void getNewMovieList() async {
    try {
      List<Movie> movieList;
      movieList = await _repository.getMovies(
          "$BASE_URL/popular?api_key=$API_KEY&language=en-US&page=$pageNumber");
      itemList.addAll(movieList);

    } on Exception catch (e) {
      print(e);
      throw e;
    }
  }

  /// Get more data form API if u want to load more
  void getMoreList(){
    pageNumber++;
    getNewMovieList();
    itemList.refresh();
  }

  /// Show if it is Bottom of the list
  /// - if true show Load more
  bool isBottom(int index){
    index+=2;
    if(index == itemList.length){
      return true;
    }
    return false;
  }

}