import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  final emailController = TextEditingController();

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
                            text: 'Reset ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'your\n',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: 'password.',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      // EMAIL
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          isDense: true,
                          hintStyle: const TextStyle(
                              fontSize: 18.0, color: Colors.black54),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            inputText: 'Reset',
            icon: FontAwesomeIcons.arrowRight,
            color: kButtonSecondaryColor,
            iconColor: kTertiaryColor,
            onClick: () => {
              AuthController.instance
                  .resetPassword(emailController.text.trim()),
            },
          ),
        ),
      ),
    );
  }
}
