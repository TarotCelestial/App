import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/controllers/home/home_controller.dart';
import 'package:tarotcelestial/controllers/sections/chats_controller.dart';
import 'package:tarotcelestial/repos/personalized_firebase_chat_core_repo.dart';

import '../../providers/user_provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  final types.Room room;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatController = Get.put(ChatController());
  void _handleMessageTap(BuildContext context, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        final client = http.Client();
        final request = await client.get(Uri.parse(message.uri));
        final bytes = request.bodyBytes;
        final documentsDir = (await getApplicationDocumentsDirectory()).path;
        localPath = '$documentsDir/${message.name}';

        if (!File(localPath).existsSync()) {
          final file = File(localPath);
          await file.writeAsBytes(bytes);
        }
      }

      await OpenFile.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final updatedMessage = message.copyWith(previewData: previewData);

    PersonalizedFirebaseChatCoreRepo.instance
        .updateMessage(updatedMessage, widget.room.id);
  }

  void _handleSendPressed(types.PartialText message) {
    PersonalizedFirebaseChatCoreRepo.instance.sendMessage(
      message,
      widget.room.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: CustomColors.hardPrincipal,
        title: const Text('Chat'),
      ),
      body: StreamBuilder<types.Room>(
        initialData: widget.room,
        stream: PersonalizedFirebaseChatCoreRepo.instance.room(widget.room.id),
        builder: (context, snapshot) {
          return GetBuilder<ChatController>(
            init: chatController,
            initState: chatController.init(userProvider),
            builder: (_) {
              if (_.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: CustomColors.hardPrincipal,
                  ),
                );
              }
              if (_.preguntas == -1) {
                return const Center(
                  child: Text("ha sucedido un error"),
                );
              }
              return StreamBuilder<List<types.Message>>(
                initialData: const [],
                stream: PersonalizedFirebaseChatCoreRepo.instance
                    .messages(snapshot.data!),
                builder: (context, snapshot) {
                  return Stack(
                    children: [
                      SafeArea(
                        bottom: false,
                        child: Chat(
                          l10n: const ChatL10nEs(),
                          messages: snapshot.data ?? [],
                          onMessageTap: _handleMessageTap,
                          onPreviewDataFetched: _handlePreviewDataFetched,
                          onSendPressed: _handleSendPressed,
                          user: types.User(
                            id: PersonalizedFirebaseChatCoreRepo
                                    .instance.firebaseUser?.uid ??
                                '',
                          ),
                        ),
                      ),
                      _.preguntas == 0
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: CustomColors.hardPrincipal,
                                height: 80,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text("Parece que no te quedan mas preguntas",style: TextStyle(
                                        fontSize: 18,
                                          color: Colors.white),),
                                      GestureDetector(
                                        onTap: (){
                                          Get.find<HomeController>().changeSection(4);
                                          Get.back();
                                        },
                                        child: const Text("Recarga y no te quedes con la duda",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            decoration: TextDecoration.underline,
                                            color: Colors.white),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.hardPrincipal.withOpacity(0.8),
                            border: Border.all(
                                color: CustomColors.hardPrincipal, width: 2),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Preguntas restantes: " + _.preguntas.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
