import 'package:flutter/material.dart';

class HoroscopoRead extends StatelessWidget {
  const HoroscopoRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Hoy", style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Febrero 21, 2022", style: TextStyle(fontSize: 14, color: Colors.black38)),
          SizedBox(height: 10,),
          Text("Estarás intuyendo muy bien con quien juntarte y de quien cuidarte en esos grupos sociales, de amigos, clubes o sociedades a las que perteneces. La energía de la Luna desde tu casa 11 te vuelve muy intuitivo y capaz de leer las intenciones de las personas que te rodean.", style: TextStyle(fontSize: 15.5, color: Colors.black54),)
        ],
      ),
    );
  }
}
