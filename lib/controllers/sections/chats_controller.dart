import 'dart:core';
import 'package:get/get.dart';
import 'package:tarotcelestial/repos/http_repo.dart';
import 'package:tarotcelestial/widgets/custom_dialog.dart';

import '../../providers/user_provider.dart';

class ChatController extends GetxController {
  bool loading=true;
  var preguntas;
  UserProvider? userProvider;

  init(UserProvider userProvider){
    this.userProvider=userProvider;
    if(userProvider.getUser!.personType==2){
      preguntas=1;
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

  Future<bool> decreace()async {
    if(userProvider!.getUser!.personType==2){
      return true;
    }
    var response = await HttpRepo().decreaseQuestions(userProvider!.getUser!.person!.id!, userProvider!.getUser!.accessToken!);
    if(response==null){
      Get.dialog(CustomDialog("Ah sucedido un error"));
      return false;
    }
    preguntas--;
    update();
    return true;
  }
}