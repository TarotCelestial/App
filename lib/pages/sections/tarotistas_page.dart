import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/pages/advisers/adviser_info_page.dart';
import 'package:tarotcelestial/pages/advisers/widgets/advisers_top_info.dart';
import '../../controllers/sections/tarotistas_controller.dart';

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
          return ListView.builder(
            itemCount: _.tarotistas.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: (){
                    Get.to(AdviserInfoPage(_,index));
                  },
                  child: AdvisersTopInfo(
                      _, index
                  ),
                ),
              );
            },
          );
        });
  }
}
