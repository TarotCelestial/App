import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/pages/advisers/adviser_info_page.dart';

class AdviserCard extends StatelessWidget {
  String photo, name, perk;

  AdviserCard(this.photo, this.name, this.perk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const AdviserInfoPage());
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.network(photo),
                ),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                perk,
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
