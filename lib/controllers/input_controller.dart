import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class InputController extends GetxController {
  static InputController instance = Get.find();

  final roomGlobal = ''.obs;
  /*
  ***************************************
  ********* DropDown Controller *********
  ***************************************
  */
  final selected = ''.obs;

  void setSelectedDD(String value) {
    selected.value = value;
  }

  /*
  ******************************************
  ********* RadioButton Controller *********
  ******************************************
  */
  final radioSelected = 0.obs;

  void setSelectedRB(int value) {
    radioSelected.value = value;
  }

  //NOT USED
  //Controlla se il pulsante è selezionato tramite index
  bool checkSelectedRB(int value) {
    if (radioSelected.value == value) {
      return true;
    }
    return false;
  }

/*
  ******************************************
  ********* OrderSubmitted Controller *********
  ******************************************
  */

  late DateTime now;
  // DateTime now = DateTime.now();
  String nowFormatted = '';
  late DateTime dataOrdine;
  String dataOrdineFormatted = '';

  // Check if Order Date Local is not null //STRING
  checkDataOrdineLocallySaved() {
    if (GetStorage().read('dataOrdineFormatted').toString().isNotEmpty) {
      return GetStorage().read('dataOrdineFormatted').toString();
    }
    return '';
  }

  // Check if Order Local is not null //BOOL
  checkOrderLocallySaved() {
    if (GetStorage().read('order') != null) {
      return GetStorage().read('order');
    }
    return false;
  }

  // Reset value of Order if is before current day //BOOL
  resetOrderFlag() {
    // now = DateTime(2023, 01, 01);
    now = DateTime.now();
    nowFormatted = DateFormat('yyyy-MM-dd').format(now);

    dataOrdineFormatted = checkDataOrdineLocallySaved();
    debugPrint('PRIMAdataOrdineFormatted: $dataOrdineFormatted');
    debugPrint('PRIMAadessoFormatted: $nowFormatted');
    if (dataOrdineFormatted.isNotEmpty) {
      // check if dataOrdineFormatted IS BEFORE adessoFormatted
      if (dataOrdineFormatted.compareTo(nowFormatted) < 0) {
        GetStorage().write('order', false);
        debugPrint('dataOrdineFormatted: $dataOrdineFormatted');
        debugPrint('adessoFormatted: $nowFormatted');
      }
    }
  }

  // checkOrderDate() {
  //   now = DateTime.now();
  //   nowFormatted = DateFormat('yyyy-MM-dd hh:mm').format(now);
  //   // if (getData('dateOrder') != '') {
  //   //   dateOrderFormatted = getData('dateOrder')!;
  //   // }

  //   //if (nowFormatted.isAfter(dateOrderFormatted)) {
  //   if (nowFormatted.compareTo(locallyDate) > 0) {
  //     changeOrderStatus(false);
  //     debugPrint('OrderStatus was resetted!');
  //     debugPrint('nowFormatted: $nowFormatted');
  //     debugPrint('dateOrderFormatted: $locallyDate');
  //     debugPrint('nowFormatted - dateOrderFormatted > 0');
  //   } else if (nowFormatted.compareTo(locallyDate) < 0) {
  //     debugPrint('nowFormatted: $nowFormatted');
  //     debugPrint('dateOrderFormatted: $locallyDate');
  //     debugPrint('nowFormatted - dateOrderFormatted < 0');
  //   } else if (nowFormatted.compareTo(locallyDate) == 0) {
  //     debugPrint('nowFormatted: $nowFormatted');
  //     debugPrint('dateOrderFormatted: $locallyDate');
  //     debugPrint('nowFormatted - dateOrderFormatted == 0');
  //   }
  // }
}
