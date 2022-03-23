import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/providers/user_provider.dart';
import 'package:tarotcelestial/repos/http_repo.dart';
import 'package:tarotcelestial/widgets/custom_dialog.dart';

class CargarController extends GetxController {
  bool available = false;
  int _index = 0;
  List<ProductDetails> products = [];
  bool loading = true;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  init(userProvider) async {
    available = await InAppPurchase.instance.isAvailable();
    if (available) {
      const Set<String> _kIds = <String>{
        'questions_1',
        'questions_2',
        'questions_3',
        'questions_4'
      };
      final ProductDetailsResponse response =
          await InAppPurchase.instance.queryProductDetails(_kIds);
      products = response.productDetails;
      if (products.isNotEmpty) {
        loading = false;
        update();
      }
    }
    final Stream<List<PurchaseDetails>> purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList, userProvider);
    }, onDone: () {
      _subscription!.cancel();
    }, onError: (error) {
      // handle error here.
    });
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList,
      UserProvider userProvider) async {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        Get.defaultDialog(
          content: const CircularProgressIndicator(
            color: CustomColors.hardPrincipal,
          ),
        );
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          //Get.dialog(CustomDialog("Ah sucedido un error"));
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          increaseQuestions(userProvider, purchaseDetails);
        }
      }
    });
  }

  buy() {
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: products[_index]);
    InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
  }

  setIndex(int index) {
    _index = index;
    update();
  }

  getIndex() {
    return _index;
  }

  increaseQuestions(UserProvider userProvider, PurchaseDetails purchaseDetails) async {
    var url = await HttpRepo().increaseQuestions(
        userProvider.getUser!.person!.id!,
        _index + 1,
        userProvider.getUser!.accessToken!);
    await InAppPurchase.instance.completePurchase(purchaseDetails);
    if (url == null) {
      /*Get.dialog(
        CustomDialog("Ah sucedido un error"),
      );*/
      return;
    }
    /*Get.dialog(
      CustomDialog("Felicidades, ya puedes usar tus deseos"),
    );*/
  }
}
