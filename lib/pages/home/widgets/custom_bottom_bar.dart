import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../assets/custom-colors.dart';
import '../../../controllers/home/home_controller.dart';
import '../../../providers/user_provider.dart';
import '../../../widgets/custom_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return GetBuilder<HomeController>(
        builder: (_) {
          return CustomBottomBar2(
            containerHeight: 65,
            backgroundColor: Colors.white,
            selectedIndex: _.index,
            showElevation: true,
            itemCornerRadius: 22,
            curve: Curves.easeIn,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            onItemSelected: (index) => _.changeSection(index),
            items: userProvider.getUser?.personType==1||userProvider.getUser?.personType==null?[
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
            ]:[
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
                icon: const Icon(Icons.coffee_outlined,),
                title: const Text('Artículos'),
                activeColor: CustomColors.hardPrincipal,
                inactiveColor: CustomColors.grey,
                textAlign: TextAlign.center,
              ),
            ],
          );
        });
  }
}
