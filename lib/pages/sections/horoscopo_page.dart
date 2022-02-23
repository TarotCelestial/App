import 'package:flutter/material.dart';
import 'package:tarotcelestial/pages/sections/widgets/horoscopo/horoscopo_more.dart';
import 'package:tarotcelestial/pages/sections/widgets/horoscopo/horoscopo_read.dart';
import 'package:tarotcelestial/pages/sections/widgets/horoscopo/horoscopo_sign_selector.dart';

import '../../assets/custom-colors.dart';

class HoroscopoPage extends StatelessWidget {
  const HoroscopoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: CustomColors.principal),
      child: ListView(
        children: [
          HoroscopoSignSelector(),
          const Divider(color: Colors.black12,thickness: 3, ),
          const HoroscopoRead(),
          const HoroscopoMore(),
        ],
      ),
    );
  }
}
