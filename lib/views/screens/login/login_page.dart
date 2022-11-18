import 'package:dimora_duomo/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
          )),
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
                              // controller.signInWithGoogle,
                              AuthService().signInWithGoogle(),
                            },
                          ),
                          // SizedBox(
                          //     height:
                          //         MediaQuery.of(context).size.height * 0.02),
                          //Twitter Sign-in button
                          // CustomButton(
                          //   inputText: 'Sign in with Twitter',
                          //   icon: FontAwesomeIcons.twitter,
                          //   color: kTertiaryColor,
                          //   iconColor: kButtonSecondaryColor,
                          //   onClick: () => {
                          //     Get.to(() => SelectRoomPage()),
                          //   },
                          // ),
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
                              Get.to(() => LoginEmailPage()),
                            },
                          ),
                          // const SizedBox(height: 40.0)
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
