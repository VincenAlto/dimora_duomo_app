import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class OrderSubmitted extends StatelessWidget {
  const OrderSubmitted({super.key});

  @override
  Widget build(BuildContext context) {
    //WillPopScope disable swipe back on iOS
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            color: kButtonSecondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    const Icon(
                      CustomIcons.coffee,
                      size: 128,
                      color: kBackgroundColor,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Order \nsubmitted!',
                      style: TextStyle(
                          color: kTertiaryColor,
                          fontSize: 48,
                          fontWeight: FontWeight.w300),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
