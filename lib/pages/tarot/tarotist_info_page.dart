import 'package:flutter/material.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';

import '../../controllers/sections/tarotistas_controller.dart';
import 'widgets/tarotist_body_info.dart';
import 'widgets/tarotist_top_info.dart';

class TarotistInfoPage extends StatelessWidget {
  TarotistasController controller;
  int index;

  TarotistInfoPage(this.controller, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColors.hardPrincipal),
      body: Theme(
        data: ThemeData(accentColor: CustomColors.principal),
        child: ListView(
          children: [
            TarotistTopInfo(controller, index),
            const Divider(
              color: Colors.black12,
              thickness: 6,
            ),
            TarotistBodyInfo(controller, index),
          ],
        ),
      ),
    );
  }
}
