import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class InputController extends GetxController {
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

  //Controlla se il pulsante è selezionato tramite index
  bool checkSelectedRB(int value) {
    if (radioSelected.value == value) {
      return true;
    }
    return false;
  }

//??
  bool checkstocaRB(int value) {
    if (radioSelected.value == 1 || radioSelected.value == 2) {
      return true;
    }
    return false;
  }

  /*
  ******************************************
  ********* TextField Controller *********
  ******************************************
  */
  // final textFormFieldController = TextEditingController();

  // @override
  // void onClose() {
  //   textFormFieldController.dispose();
  //   super.onClose();
  // }

  // String? validator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please this field must be filled';
  //   }
  //   return null;
  // }

/*
  ******************************************
  ********* OrderSubmitted Controller *********
  ******************************************
  */

  // DateTime now = DateTime(0);
  // // late DateTime nowFormatted = DateTime(now.year, now.month, now.day);
  // DateTime dateOrder = DateTime(0);
  // // late DateTime dateOrderFormatted =
  // // DateTime(dateOrder.year, dateOrder.month, dateOrder.day);
  // late String dateOrderFormatted = '';
  // late String nowFormatted = '';
  // late String locallyDate = '';
  // late bool localStatusOrder;

  late DateTime adesso;
  String adessoFormatted = '';
  late DateTime dataOrdine;
  String dataOrdineFormatted = '';

  bool orderSubmitted = false;

  changeOrderStatus(bool newValue) {
    //For boleans change value with single =
    orderSubmitted = newValue;
  }

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
    // adesso = DateTime(2023, 01, 01);
    adesso = DateTime.now();
    adessoFormatted = DateFormat('yyyy-MM-dd').format(adesso);

    dataOrdineFormatted = checkDataOrdineLocallySaved();
    debugPrint('PRIMAdataOrdineFormatted: $dataOrdineFormatted');
    debugPrint('PRIMAadessoFormatted: $adessoFormatted');
    if (dataOrdineFormatted.isNotEmpty) {
      // check if dataOrdineFormatted IS BEFORE adessoFormatted
      if (dataOrdineFormatted.compareTo(adessoFormatted) < 0) {
        GetStorage().write('order', false);
        debugPrint('dataOrdineFormatted: $dataOrdineFormatted');
        debugPrint('adessoFormatted: $adessoFormatted');
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
