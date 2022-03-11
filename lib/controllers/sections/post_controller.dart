import 'dart:core';
import 'package:get/get.dart';

import '../../repos/http_repo.dart';

class PostController extends GetxController {
  List post = [];

  init(){
    HttpRepo().getPost().then((value){
      post = value;
      update();
    });
  }

  String getFecha(index){
    DateTime date = DateTime.parse(post[index]["fecha"]);
    final dateString = date.day.toString() +
        "-" +
        date.month.toString() +
        "-" +
        date.year.toString();
    return dateString;
  }
}