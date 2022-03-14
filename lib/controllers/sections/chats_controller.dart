import 'dart:core';
import 'package:get/get.dart';
import 'package:tarotcelestial/repos/http_repo.dart';

import '../../providers/user_provider.dart';

class ChatController extends GetxController {
  bool loading=true;
  var preguntas;

  init(UserProvider userProvider){
    if(userProvider.getUser!.personType==2){
      preguntas=0;
      loading=false;
      update();
      return;
    }
    HttpRepo().getQuestions(userProvider.getUser!.accessToken!,
        userProvider.getUser!.person!.id!).then((value){
      if(value==null){
        preguntas = -1;
        loading=false;
        update();
        return;
      }
      preguntas = value["preguntas"];
      loading=false;
      update();
      return;
    });
  }
}