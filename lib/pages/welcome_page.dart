import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/login_page.dart';
import 'package:flutter_chatme/pages/register_page.dart';
import 'package:flutter_chatme/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/';
  WelcomePage({Key? key}) : super(key: key);

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

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCirc,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Opacity(
              opacity: animation.value,
              child: Image.asset(
                'assets/background.png',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                    Text(
                      'ChatMe',
                      style: GoogleFonts.poppins(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: ChatMeStyles.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          LoginPage.routeName,
                        );
                      },
                      minWidth: 200.0,
                      height: 56.0,
                      child: Text(
                        'Login',
                        style: ChatMeStyles.buttonTextStyle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: ChatMeStyles.primaryTextColor,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RegisterPage.routeName,
                        );
                      },
                      minWidth: 200.0,
                      height: 56.0,
                      child: Text(
                        'Register',
                        style: ChatMeStyles.buttonTextStyle.copyWith(
                          color: ChatMeStyles.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
