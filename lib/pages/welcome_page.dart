import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/chat_page.dart';
import 'package:flutter_chatme/pages/login_page.dart';
import 'package:flutter_chatme/pages/register_page.dart';
import 'package:flutter_chatme/pages/widgets/widgets.dart';
import 'package:flutter_chatme/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCirc,
    );

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacementNamed(
          context,
          ChatPage.routeName,
        );
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          UniqueBackground(opacity: animation.value),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /**
                 * App Title & Logo
                 */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('assets/chatme.png'),
                        height: animation.value * 64.0,
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    animation.value == 1
                        ? AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'ChatMe',
                                textStyle: GoogleFonts.poppins(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                speed: const Duration(milliseconds: 300),
                              ),
                            ],
                            pause: const Duration(milliseconds: 300),
                            totalRepeatCount: 1,
                          )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
                /**
                 * Login Button
                 * Primary Style
                 */
                CustomButton(
                  text: 'Login',
                  color: ChatMeStyles.primaryColor,
                  revertColor: false,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      LoginPage.routeName,
                    );
                  },
                ),
                /**
                 * Register Button
                 * Revert Style
                 */
                CustomButton(
                  text: 'Register',
                  color: Colors.transparent,
                  revertColor: true,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RegisterPage.routeName,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
