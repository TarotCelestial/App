import 'package:flutter/material.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/pages/advisers/widgets/adviser_body_info.dart';
import 'package:tarotcelestial/pages/advisers/widgets/advisers_top_info.dart';

class AdviserInfoPage extends StatelessWidget {
  const AdviserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColors.hardPrincipal,),
      body: Theme(
        data: ThemeData(accentColor: CustomColors.principal),
        child: ListView(
          children: [
            AdvisersTopInfo(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg",
              "Scarlett",
              "Amor",
            ),
            const Divider(color: Colors.black12,thickness: 6, ),
            const AdviserBodyInfo(),
          ],
        ),
      ),
    );
  }
}
