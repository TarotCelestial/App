import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/controllers/home/home_controller.dart';
import 'package:tarotcelestial/pages/home/widgets/custom_bottom_bar.dart';
import '../../assets/custom-colors.dart';
import '../sections/articulos_page.dart';
import '../sections/chats_page.dart';
import 'widgets/custom_drawer.dart';

class TarotistHomePage extends StatefulWidget {
  const TarotistHomePage({Key? key}) : super(key: key);

  @override
  _TarotistHomePageState createState() => _TarotistHomePageState();
}

class _TarotistHomePageState extends State<TarotistHomePage> {
  final homeSectionController = Get.put(HomeController());
  List pages = [
    const ChatsPage(),
    const ArticulosPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: homeSectionController,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: CustomColors.hardPrincipal,
              title: Text(_.tarotistasSections[_.index]),
            ),
            drawer: const CustomDrawer(),
            body: pages[_.index],
            bottomNavigationBar: const CustomBottomBar(),
          );
        });
  }
}
