import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/user_provider.dart';

class HomeController extends GetxController {
  var isLoged = false.obs;
  int index=0;
  List<String> sections = ["Tarotistas", "Artículos", "Chats", "Horóscopo", "Cargar"];

  obtainSesion(UserProvider userProvider) async {
    var prefs = await SharedPreferences.getInstance();
    isLoged.value = prefs.getBool("isLoged")??false;
  }

  closeSesion() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoged", false);
    isLoged.value = false;
    await FirebaseAuth.instance.signOut();
  }

  changeSection(int index){
    this.index=index;
    update();
  }
}