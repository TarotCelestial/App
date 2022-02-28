import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../assets/custom-colors.dart';
import '../../../controllers/home/home_controller.dart';
import '../../../widgets/custom_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) {
          return CustomBottomBar2(
            containerHeight: 65,
            backgroundColor: Colors.white,
            selectedIndex: _.index,
            showElevation: true,
            itemCornerRadius: 22,
            curve: Curves.easeIn,
            onItemSelected: (index) => _.changeSection(index),
            items: [
              BottomNavyBarItem(
                icon: const Icon(Icons.search),
                title: const Text('Tarotistas'),
                activeColor: CustomColors.hardPrincipal,
                inactiveColor: CustomColors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.coffee_outlined,),
                title: const Text('Artículos'),
                activeColor: CustomColors.hardPrincipal,
                inactiveColor: CustomColors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.chat_bubble_outline),
                title: const Text(
                  'Chats',
                ),
                activeColor: CustomColors.hardPrincipal,
                inactiveColor: CustomColors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(FontAwesomeIcons.star),
                title: const Text('Horóscopo'),
                activeColor: CustomColors.hardPrincipal,
                inactiveColor: CustomColors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.attach_money),
                title: const Text('Cargar'),
                activeColor: CustomColors.hardPrincipal,
                inactiveColor: CustomColors.grey,
                textAlign: TextAlign.center,
              ),
            ],
          );
        });
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: IconTheme(
        data: const IconThemeData(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(9),
              child: InkResponse(
                highlightShape: BoxShape.rectangle,
                containedInkWell: false,
                onTap: (){

                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.search, color: CustomColors.grey),
                    const SizedBox(height: 3,),
                    Text("Asesores", style: TextStyle(fontSize: 15, color: CustomColors.grey),)
                  ],
                ),
              ),
            ),
            InkResponse(
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.mugHot, color: CustomColors.grey),
                    const SizedBox(height: 5,),
                    Text("Artículos", style: TextStyle(fontSize: 15, color: CustomColors.grey),)
                  ],
                ),
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.comment, color: CustomColors.grey),
                    const SizedBox(height: 5,),
                    Text("Asesores", style: TextStyle(fontSize: 15, color: CustomColors.grey),)
                  ],
                ),
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.star, color: CustomColors.grey),
                    const SizedBox(height: 5,),
                    Text("Asesores", style: TextStyle(fontSize: 15, color: CustomColors.grey),)
                  ],
                ),
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.dollarSign, color: CustomColors.grey),
                    const SizedBox(height: 5,),
                    Text("Asesores", style: TextStyle(fontSize: 15, color: CustomColors.grey),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
