import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/data/models/hive_models/user_data.dart';
import 'package:tarotcelestial/data/models/personal_data_model.dart';
import 'package:tarotcelestial/providers/user_provider.dart';
import 'package:tarotcelestial/repos/http_repo.dart';
import 'package:tarotcelestial/widgets/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/constants/constants.dart';
import '../../data/models/zodiac_sign_model.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  ZodiacSign? dropSignIndex = Constants.zodiacSigns.first;
  String? dropCountryIndex = Constants.countries.first;
  List signs = Constants.zodiacSigns;
  List countries = Constants.countries;
  
  bool showPassword = true;

  invertShowPassword() {
    showPassword = !showPassword;
    update();
  }

  login(String email, String password, UserProvider userProvider) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator(color: CustomColors.hardPrincipal,))
    );
    Map body = {"email": email, "password": password};
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.dialog(
          CustomDialog("No se encontró cuenta para este email"),
        );
      } else if (e.code == 'wrong-password') {
        Get.dialog(
          CustomDialog("Contraseña incorrecta"),
        );
      }
      return;
    }
    var response = await HttpRepo().login(body);
    if (response == null) {
      Get.back();
      Get.dialog(
        CustomDialog("Ha sucedido un error en la autenticación"),
      );
      return;
    }
    final box = Hive.box<UserData>('UserData');
    userProvider.setUser(PersonalData.fromJson(response));
    box.clear();
    box.add(UserData(response));
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoged', true);
    Get.back();
    Get.offAllNamed('/home-page');
  }


  changeSingIndex(ZodiacSign sign){
    dropSignIndex=sign;
    update();
  }
  changeCountryIndex(String country){
    dropCountryIndex=country;
    update();
  }

  register(String email, String psw1, String psw2, String firstNames,
      String lastNames, UserProvider userProvider) async {
    if(psw1!=psw2){
      Get.dialog(
          CustomDialog("Las contraseñas no coinciden"),
      );
      return;
    }
    Get.dialog(
        const Center(child: CircularProgressIndicator(color: CustomColors.hardPrincipal,))
    );
    Map body = {
      "email": email,
      "username": email,
      "signo": signs.indexWhere((element) => element.name==dropSignIndex!.name),
      "pais": dropCountryIndex,
      "password": psw1,
      "password_confirmation": psw2,
      "first_name": firstNames,
      "last_name": lastNames
    };
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: psw1
      );
      await FirebaseChatCore.instance.createUserInFirestore(
        types.User(
          firstName: firstNames,
          id: userCredential.user!.uid,
          lastName: lastNames,
          metadata: {"email": email},
          role: types.Role.user
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.dialog(
          CustomDialog("La contraseña es muy debil"),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.dialog(
          CustomDialog("Este correo ya esta registrado"),
        );
      }
      return;
    } catch (e) {
      return;
    }
    var response = await HttpRepo().register(body);
    if (response == null) {
      Get.back();
      Get.dialog(
        CustomDialog("Ha sucedido un error en el registro"),
      );
      return;
    }
    final box = Hive.box<UserData>('UserData');
    userProvider.setUser(PersonalData.fromJson(response));
    box.clear();
    box.add(UserData(response));
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoged', true);
    Get.back();
    Get.offAllNamed('/home-page');
  }
}
