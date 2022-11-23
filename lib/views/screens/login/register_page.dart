import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                            text: 'Create ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'a',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: '\nnew ',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: 'account.',
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
                      //CustomTextFormField(), commentato perchè è questo scritto sotto
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.all(16.0),
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
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.all(16.0),
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          hintText: 'Password',
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
            inputText: 'Register',
            icon: FontAwesomeIcons.arrowRight,
            color: kButtonSecondaryColor,
            iconColor: kTertiaryColor,
            onClick: () => {
              AuthController.instance.register(
                  emailController.text.trim(), passwordController.text.trim())
            },
          ),
        ),
      ),
    );
  }
}
