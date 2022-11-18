import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/views/screens/login/register_page.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginEmailPage extends StatelessWidget {
  LoginEmailPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            text: 'Login ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'with\n',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: 'your account.',
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
                      const SizedBox(height: 20),
                      // PASSWORD
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
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
                      Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => ResetPasswordPage());
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: kTertiaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Don\'t have an account?',
                              style: TextStyle(color: kTertiaryColor),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => RegisterPage());
                              },
                              child: const Text(
                                'Sign-up',
                                style: TextStyle(
                                    color: kTertiaryColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
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
            inputText: 'Login',
            icon: FontAwesomeIcons.arrowRight,
            color: kButtonSecondaryColor,
            iconColor: kTertiaryColor,
            onClick: () => {
              AuthController.instance.login(
                  emailController.text.trim(), passwordController.text.trim()),
            },
          ),
        ),
      ),
    );
  }
}
