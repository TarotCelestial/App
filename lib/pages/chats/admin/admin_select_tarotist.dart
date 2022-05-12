import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/controllers/sections/chat_admin_controller.dart';
import 'package:tarotcelestial/pages/chats/admin/admin_rooms_scafold.dart';

import '../../../assets/util.dart';
import '../rooms.dart';

class AdminSelectTarotist extends StatelessWidget {
  AdminSelectTarotist({Key? key}) : super(key: key);
  final ChatAdminController chatAdminController =
      Get.put(ChatAdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChatAdminController>(
          init: chatAdminController,
          initState: (_) => chatAdminController.init(),
          builder: (_) {
            if(_.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: _.tarotists.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(AdminRoomsScaffold(_.tarotists[index]['uid'],));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildAvatar(_.tarotists[index]),
                        Text(
                          _.tarotists[index]["nombre_artistico"] ?? '',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  Widget _buildAvatar(Map tarotist) {
    var color = getUserAvatarNameColorId(tarotist["sobre"].length);

    final hasImage = tarotist["user"]["imagen"] != "";
    final name = tarotist["nombre_artistico"] ?? '';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage:
            hasImage ? NetworkImage(tarotist["user"]["imagen"]) : null,
        radius: 25,
        child: !hasImage
            ? Text(
                name.isEmpty ? '' : name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 22),
              )
            : null,
      ),
    );
  }
}
