import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/pages/advisers/widgets/adviser_perk.dart';

import '../../../controllers/sections/tarotistas_controller.dart';

class AdviserBodyInfo extends StatelessWidget {
  TarotistasController controller;
  int index;

  AdviserBodyInfo(this.controller, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sobre mí",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12,),
          ExpandableText(
            controller.tarotistas[index]["sobre"],
            style: const TextStyle(color: Colors.black54, fontSize: 14.5),
            linkStyle: const TextStyle(color: CustomColors.principal, fontSize: 17.5),
            linkEllipsis: false,
            expandText: '\n\nVer más',
            animation: true,
            collapseText: '\n\nVer menos',
            maxLines: 5,
            linkColor: CustomColors.hardPrincipal,
          ),
          const SizedBox(height: 15,),
          const Text(
            "Experiencia",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12,),
          ExpandableText(
              controller.tarotistas[index]["experiencia"],
            style: const TextStyle(color: Colors.black54, fontSize: 14.5),
            linkStyle: const TextStyle(color: CustomColors.principal, fontSize: 17.5),
            linkEllipsis: false,
            expandText: '\n\nVer más',
            animation: true,
            collapseText: '\n\nVer menos',
            maxLines: 5,
            linkColor: CustomColors.hardPrincipal,
          ),
          const SizedBox(height: 15,),
          const Text(
            "Especialidades",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12,),
          Wrap(
            children: [
              for(var i in controller.tarotistas[index]["especialidades"])
                AdviserPerk(i["nombre"])
            ],
          ),
        ],
      ),
    );
  }
}
