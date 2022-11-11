import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'screens.dart';

// ignore: must_be_immutable
class SelectRoomPage extends StatelessWidget {
  SelectRoomPage({super.key});

  final InputController textController = Get.find();

  var languageSelected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/DD_Appbar.png',
          fit: BoxFit.cover,
          width: 250,
        ),
        centerTitle: true,
        // Remove back button AppBar
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                height: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.bottomCenter,
                child: const Text.rich(
                  TextSpan(
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 32.0,
                      ),
                      children: [
                        TextSpan(
                            text: 'Select your\n',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: 'language',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '\n& ',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: 'room number.',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: [
                      CustomDropDown(
                        hintText: 'Language',
                        list: languages,
                        onAnswer: (ans) {
                          languageSelected = ans;
                          debugPrint(languageSelected);
                        },
                      ),
                      const SizedBox(height: 50),
                      //CustomTextFormField(), commentato perchè è questo scritto sotto
                      TextFormField(
                        keyboardType:
                            defaultTargetPlatform == TargetPlatform.iOS
                                ? const TextInputType.numberWithOptions(
                                    decimal: false, signed: true)
                                : TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 3,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: textController.validator,
                        controller: textController.textFormFieldController,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.all(16.0),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Room number',
                          hintStyle: const TextStyle(
                              fontSize: 18.0, color: Colors.black54),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kBackgroundColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
          child: CustomButton(
            inputText: 'Go to services',
            icon: FontAwesomeIcons.clipboard,
            color: kButtonSecondaryColor,
            iconColor: kTertiaryColor,
            onClick: () => {
              if (textController.textFormFieldController.text != '')
                {
                  debugPrint(
                      'Room inserted: ${textController.textFormFieldController.text}'),
                  debugPrint('Language selected: $languageSelected'),
                  Get.to(() => HomePage(),
                      arguments: textController.textFormFieldController.text)
                }
              else
                {
                  Get.snackbar(
                    'Attention',
                    'You have to set room number.',
                    colorText: kBackgroundColor,
                    backgroundColor: kButtonSecondaryColor,
                  ),
                }
            },
          ),
        ),
      ),
    );
  }
}