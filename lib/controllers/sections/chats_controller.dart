import 'dart:core';
import 'package:get/get.dart';
import 'package:tarotcelestial/repos/http_repo.dart';
import 'package:tarotcelestial/widgets/custom_dialog.dart';

import '../../providers/user_provider.dart';

class ChatController extends GetxController {
  bool loading=true, tarotist=false;
  var preguntas;
  UserProvider? userProvider;


  init(UserProvider userProvider){
    this.userProvider=userProvider;
    if(userProvider.getUser!.personType==2||userProvider.getUser!.personType==0){
      tarotist=true;
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

  Future decreace(String clientEmail)async {
    var response = await HttpRepo().decreaseQuestions(clientEmail, userProvider!.getUser!.accessToken!);
    if(response==null){
      Get.dialog(CustomDialog("Ha sucedido un error"));
      return;
    }
    if(response==400){
      Get.dialog(CustomDialog("El cliente ya no tiene preguntas"));
      return;
    }
    Get.dialog(CustomDialog("Se descontó la pregunta satisfactoriamente"));
  }

  Future<bool> haveQuestions(int id)async {
    var response = await HttpRepo().getQuestions(userProvider!.getUser!.accessToken!, id);
    if(response==null){
      Get.dialog(CustomDialog("Ha sucedido un error"));
      return false;
    }
    preguntas = response["preguntas"];
    if(preguntas==0){
      return false;
    }
    return true;
  }

  SendNotification(String token)async{

  }
}