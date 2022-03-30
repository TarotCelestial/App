import 'dart:core';
import 'package:get/get.dart';
import 'package:tarotcelestial/repos/http_repo.dart';

class HoroscopoController extends GetxController {
  var Horoscope = {}.obs;
  int index = 0;

  init(user) {
    try{
      index = int.parse(user != null ? user.person!.signo : "0");
    } catch (e) {
    }
    HttpRepo().getHoroscope().then((value) {
      Horoscope.value = value;
    });
    update();
  }

  changeSelected(int index) {
    this.index = index;
    update();
  }

  String signHoroscope() {
    return Horoscope.value[Horoscope.value.keys.elementAt(index + 2)];
  }
}
