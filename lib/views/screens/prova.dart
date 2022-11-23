import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prova extends StatelessWidget {
  const Prova({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('back'),
      )),
    );
  }
}
