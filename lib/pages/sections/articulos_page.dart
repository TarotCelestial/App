import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/pages/sections/widgets/articulos/articulo_card.dart';

import '../../controllers/sections/post_controller.dart';
import '../post/post.dart';

class ArticulosPage extends StatelessWidget {
  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
        init: postController,
        initState: postController.init(),
        builder: (_) {
          if (_.post.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: CustomColors.hardPrincipal,
              ),
            );
          }
          return Theme(
            data: ThemeData(accentColor: CustomColors.principal),
            child: ListView.builder(
              itemCount: _.post.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(Post(index));
                  },
                    child: ArticuloCard(index));
              },
            ),
          );
        });
  }
}
