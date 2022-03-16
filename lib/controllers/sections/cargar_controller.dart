import 'dart:core';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class CargarController extends GetxController {
  bool available=false;
  int _index= 0;

  List text = ["Una pregunta", "Dos preguntas","Tres preguntas","Cuatro preguntas"];
  List value = [3,5,7,9];

  init()async{
    /*available = await InAppPurchase.instance.isAvailable();
    if(available){
      const Set<String> _kIds = <String>{'questions_1', 'questions_2', 'questions_3', 'questions_4'};
      final ProductDetailsResponse response =
      await InAppPurchase.instance.queryProductDetails(_kIds);
      List<ProductDetails> products = response.productDetails;
      print(products.length);

    }
    update();*/
  }


  setIndex(int index){
    _index=index;
    update();
  }

  getIndex(){
    return _index;
  }
}