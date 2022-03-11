import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../assets/custom-colors.dart';
import '../../controllers/sections/post_controller.dart';

class Post extends StatelessWidget {
  int index;
  Post(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();
    return Scaffold(
      body: Stack(
        children: [
          Theme(
            data: ThemeData(accentColor: CustomColors.principal),
            child: ListView(
              children: [
                Image.network(
                  postController.post[index]["imagen"],
                  fit: BoxFit.fitWidth,
                  width: Get.width,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: HtmlWidget(postController.post[index]["body"]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                FontAwesomeIcons.angleLeft,
                size: 35,
                color: CustomColors.hardPrincipal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
