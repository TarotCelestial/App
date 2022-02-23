import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/controllers/home/home_controller.dart';
import 'package:tarotcelestial/pages/home/widgets/custom_bottom_bar.dart';

import '../../assets/custom-colors.dart';
import '../sections/articulos_page.dart';
import '../sections/asesores_page.dart';
import '../sections/cargar_page.dart';
import '../sections/chats_page.dart';
import '../sections/horoscopo_page.dart';
import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeSectionController = Get.put(HomeController());
  List pages = [
    const AsesoresPage(),
    const ArticulosPage(),
    const ChatsPage(),
    const HoroscopoPage(),
    const CargarPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: homeSectionController,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: CustomColors.hardPrincipal,
              title: Text(_.sections[_.index]),
            ),
            drawer: const CustomDrawer(),
            body: pages[_.index],
            bottomNavigationBar: const CustomBottomBar(),
          );
        });
  }
}