import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/controllers/sections/tarotistas_controller.dart';
import 'package:tarotcelestial/pages/phones/phones_page.dart';

import '../../../controllers/home/home_controller.dart';
import '../../../providers/user_provider.dart';

class TarotistTopInfo extends StatelessWidget {
  TarotistasController controller;
  int index;

  TarotistTopInfo(this.controller, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return SizedBox(
      height: 131,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      controller.tarotistas[index]["nombre_artistico"],
                      style: const TextStyle(
                          fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    controller.tarotistas[index]["especialidades"].isEmpty
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                controller.tarotistas[index]["especialidades"]
                                    [0]["nombre"],
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ),
                          ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors.hardComplementary),
                      ),
                      onPressed: () {
                        Get.to(() => const PhonesPage());
                      },
                      child: SizedBox(
                        width: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.phone,
                                size: 18,
                              ),
                              Divider(),
                              Text(" LLAMADA")
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              CustomColors.hardPrincipal)),
                      onPressed: () {
                        final homeController = Get.find<HomeController>();
                        homeController.changeSection(2);
                        controller.CreateRoom(
                            controller.tarotistas[index]["user"]["email"],
                            userProvider.getUser!.person!.id!,
                            controller.tarotistas[index]["user"]["id"],
                            userProvider.getUser!.accessToken!);
                      },
                      child: SizedBox(
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.chat_bubble,
                              size: 18,
                            ),
                            Divider(),
                            Text(" CHAT")
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: controller.tarotistas[index]["user"]["imagen"],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              color: CustomColors.hardPrincipal,
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
