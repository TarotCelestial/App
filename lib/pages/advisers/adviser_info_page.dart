import 'package:flutter/material.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/pages/advisers/widgets/adviser_body_info.dart';
import 'package:tarotcelestial/pages/advisers/widgets/advisers_top_info.dart';

import '../../controllers/sections/tarotistas_controller.dart';

class AdviserInfoPage extends StatelessWidget {
  TarotistasController controller;
  int index;

  AdviserInfoPage(this.controller, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColors.hardPrincipal),
      body: Theme(
        data: ThemeData(accentColor: CustomColors.principal),
        child: ListView(
          children: [
            AdvisersTopInfo(controller, index),
            const Divider(
              color: Colors.black12,
              thickness: 6,
            ),
            AdviserBodyInfo(controller, index),
          ],
        ),
      ),
    );
  }
}
