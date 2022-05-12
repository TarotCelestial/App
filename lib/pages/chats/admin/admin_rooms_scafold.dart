import 'package:flutter/material.dart';

import '../../../assets/custom-colors.dart';
import '../rooms.dart';

class AdminRoomsScaffold extends StatelessWidget {
  String? uid;
  AdminRoomsScaffold(this.uid, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.hardPrincipal,
        title: const Text('Chats'),
      ),
      body: RoomsPage(id: uid),
    );
  }
}
