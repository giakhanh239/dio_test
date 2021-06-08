import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_dio_test/ui/detail_movie/detail_movie_screen.dart';
import 'package:flutter_app_dio_test/ui/home_screen/controller/home_screen_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeScreenController _controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: Obx(
        () => ListView.builder(
          itemExtent: 40,
          itemBuilder: (context, index) {
            return _controller.isBottom(index - 1)
                ? FlatButton(
                    onPressed: () {
                      _controller.getMoreList();
                    },
                    child: Text("Load More"))
                : InkWell(
                    onTap: () {
                      Get.to(DetailMovie(movie: _controller.itemList[index]));
                    },
                    child: Text(_controller.itemList[index].title));
          },
          itemCount: _controller.itemList.length,
        ),
      ),
    );
  }
}
