import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import '../../controllers/sections/tarotistas_controller.dart';
import '../tarot/tarotist_info_page.dart';
import '../tarot/widgets/tarotist_top_info.dart';

class TarotistasPage extends StatefulWidget {
  TarotistasPage({Key? key}) : super(key: key);

  @override
  State<TarotistasPage> createState() => _TarotistasPageState();
}

class _TarotistasPageState extends State<TarotistasPage> {
  final tarotistasController = Get.put(TarotistasController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TarotistasController>(
        init: tarotistasController,
        initState: tarotistasController.init(),
        builder: (_) {
          if (_.tarotistas == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: CustomColors.hardPrincipal,
              ),
            );
          }
          if (_.tarotistas.isEmpty) {
            return const Center(
              child: Text("No hay datos para mostrar"),
            );
          }
          return Theme(
            data: ThemeData(accentColor: CustomColors.principal),
            child: ListView.builder(
              itemCount: _.tarotistas.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Get.to(TarotistInfoPage(_, index));
                    },
                    child: TarotistTopInfo(_, index),
                  ),
                );
              },
            ),
          );
        });
  }
}
