import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';

class AdvisersTopInfo extends StatelessWidget {
  String photo, name, perk;

  AdvisersTopInfo(this.photo, this.name, this.perk);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  perk,
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: CachedNetworkImage(
                  imageUrl: photo,
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
