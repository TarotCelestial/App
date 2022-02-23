import 'dart:core';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

class ChatController extends GetxController {

  createUser()async{
    await FirebaseChatCore.instance.createUserInFirestore(
      const types.User(
        firstName: 'John',
        id: 'TneUfkw9AYe2GrntwXSb7SFPjAy2', // UID from Firebase Authentication
        imageUrl: 'https://i.pravatar.cc/300',
        lastName: 'Doe',
      ),
    );
  }
}