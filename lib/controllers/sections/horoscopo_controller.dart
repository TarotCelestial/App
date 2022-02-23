import 'dart:core';
import 'package:get/get.dart';

class HoroscopoController extends GetxController {

  int index=0;

  init(){
    index=0;
    update();
  }

  changeSelected(int index){
    this.index=index;
    update();
  }
}