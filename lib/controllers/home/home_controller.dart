import 'dart:core';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int index=0;
  List<String> sections = ["Tarotistas", "Artículos", "Chats", "Horóscopo", "Cargar"];

  changeSection(int index){
    this.index=index;
    update();
  }
}