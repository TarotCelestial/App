import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/pages/advisers/widgets/adviser_perk.dart';

class AdviserBodyInfo extends StatelessWidget {
  const AdviserBodyInfo({Key? key}) : super(key: key);

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
          const ExpandableText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu convallis magna. Aenean varius turpis et gravida imperdiet. Aenean dapibus accumsan lorem, in vulputate sapien imperdiet non. Vivamus semper, augue in pellentesque lobortis, massa libero facilisis velit, ut commodo justo velit eu urna. Maecenas ut sapien vel lorem elementum cursus in eu turpis. Aliquam placerat sed dolor nec lacinia. Nam orci metus, lacinia eu feugiat at, tristique sit amet sem. Vivamus hendrerit venenatis est eu faucibus. Fusce malesuada mauris id nibh venenatis sodales. Duis et elit feugiat quam laoreet pulvinar ac efficitur libero. Suspendisse ultricies volutpat lacus, viverra pulvinar arcu rhoncus quis. Vivamus bibendum a tellus et ultricies. Donec at ante egestas, tristique urna quis, lacinia ex. Fusce eget posuere mauris, vel feugiat eros. Mauris finibus diam vitae justo dictum, nec convallis justo pulvinar. Cras convallis faucibus posuere. Vivamus pretium odio id justo hendrerit venenatis. Etiam risus augue, dictum ac aliquet a, eleifend tincidunt massa. Donec vulputate iaculis mauris quis lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi hendrerit commodo dui eu tincidunt.",
            style: TextStyle(color: Colors.black54, fontSize: 14.5),
            linkStyle: TextStyle(color: CustomColors.principal, fontSize: 17.5),
            linkEllipsis: false,
            expandText: '\n\nVer más',
            animation: true,
            collapseText: '\n\nVer menos',
            maxLines: 5,
            linkColor: Colors.blue,
          ),
          const SizedBox(height: 15,),
          const Text(
            "Experiencia",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12,),
          const ExpandableText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu convallis magna. Aenean varius turpis et gravida imperdiet. Aenean dapibus accumsan lorem, in vulputate sapien imperdiet non. Vivamus semper, augue in pellentesque lobortis, massa libero facilisis velit, ut commodo justo velit eu urna. Maecenas ut sapien vel lorem elementum cursus in eu turpis. Aliquam placerat sed dolor nec lacinia. Nam orci metus, lacinia eu feugiat at, tristique sit amet sem. Vivamus hendrerit venenatis est eu faucibus. Fusce malesuada mauris id nibh venenatis sodales. Duis et elit feugiat quam laoreet pulvinar ac efficitur libero. Suspendisse ultricies volutpat lacus, viverra pulvinar arcu rhoncus quis. Vivamus bibendum a tellus et ultricies. Donec at ante egestas, tristique urna quis, lacinia ex. Fusce eget posuere mauris, vel feugiat eros. Mauris finibus diam vitae justo dictum, nec convallis justo pulvinar. Cras convallis faucibus posuere. Vivamus pretium odio id justo hendrerit venenatis. Etiam risus augue, dictum ac aliquet a, eleifend tincidunt massa. Donec vulputate iaculis mauris quis lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi hendrerit commodo dui eu tincidunt.",
            style: TextStyle(color: Colors.black54, fontSize: 14.5),
            linkStyle: TextStyle(color: CustomColors.principal, fontSize: 17.5),
            linkEllipsis: false,
            expandText: '\n\nVer más',
            animation: true,
            collapseText: '\n\nVer menos',
            maxLines: 5,
            linkColor: Colors.blue,
          ),
          const SizedBox(height: 15,),
          const Text(
            "Especialidades",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12,),
          Wrap(
            children: [
              AdviserPerk("Amor"), AdviserPerk("Dinero"), AdviserPerk("Tarot"),
            ],
          ),
        ],
      ),
    );
  }
}
