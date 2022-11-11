import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final textFormFieldController = TextEditingController();

  @override
  void onClose() {
    textFormFieldController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

/*
  ******************************************
  ********* OrderSubmitted Controller *********
  ******************************************
  */

  final orderSubmitted = false.obs;

  changeOrderStatus(bool newValue) {
    //For boleans change value with single =
    orderSubmitted.value = newValue;
  }
}
