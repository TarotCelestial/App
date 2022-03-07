import 'dart:core';
import 'package:get/get.dart';

class CargarController extends GetxController {
  int _index= 0;

  List text = ["Una pregunta", "Dos preguntas","Tres preguntas","Cuatro preguntas"];
  List value = [3,5,7,9];

  setIndex(int index){
    _index=index;
    update();
  }

  getIndex(){
    return _index;
  }
}