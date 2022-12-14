import 'package:dimora_duomo/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class LoginPage extends StatefulWidget {
  // final LoginController controller = Get.put(LoginController());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/scaffold_BG_v2.png'),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    // padding: const EdgeInsets.only(top: 16.0),
                    // color: Colors.red,
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: const Image(
                      image: AssetImage('assets/images/logo_DD_white.png'),
                    ),
                  ),
                  //Pulsante Login Personalizzato Google
                  Expanded(
                    child: SizedBox(
                      // color: Colors.pink,
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomButton(
                            inputText: 'Sign in with Facebook',
                            icon: FontAwesomeIcons.facebookF,
                            color: kTertiaryColor,
                            iconColor: kButtonSecondaryColor,
                            onClick: () => {
                              AuthController.instance.staffValue = false,
                              // controller.signInWithFacebook,
                              AuthService().signInWithFacebook(),
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          //Facebook Sign-in button
                          CustomButton(
                            inputText: 'Sign in with Google',
                            icon: FontAwesomeIcons.google,
                            color: kTertiaryColor,
                            iconColor: kButtonSecondaryColor,
                            onClick: () => {
                              AuthController.instance.staffValue = false,
                              // controller.signInWithGoogle,
                              AuthService().signInWithGoogle(),
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              'OR',
                              style: TextStyle(
                                  fontSize: 18.0, color: kTertiaryColor),
                            ),
                          ),
                          CustomButton(
                            inputText: 'Sign with your email',
                            icon: FontAwesomeIcons.envelope,
                            color: kButtonSecondaryColor,
                            iconColor: kTertiaryColor,
                            onClick: () => {
                              AuthController.instance.staffValue = false,
                              Get.to(() => LoginEmailPage(), arguments: [
                                AuthController.instance.staffValue
                              ]),
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Are you a staff member?',
                                  style: TextStyle(color: kTertiaryColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  AuthController.instance.staffValue = true;
                                  Get.to(() => LoginEmailPage(), arguments: [
                                    AuthController.instance.staffValue
                                  ]);
                                },
                                child: const Text(
                                  'Click here',
                                  style: TextStyle(
                                      color: kTertiaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
