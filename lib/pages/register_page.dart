import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/widgets/widgets.dart';
import 'package:flutter_chatme/shared/constants.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          UniqueBackground(opacity: 1),
          CustomBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/chatme.png'),
                    height: 150.0,
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextFormField(
                    decoration: ChatMeStyles.kTextFieldDecoration.copyWith(
                      hintText: 'Email Address',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: ChatMeStyles.kTextFieldDecoration.copyWith(
                      hintText: 'Password',
                    ),
                  ),
                ),
                /**
                 * Register Button
                 * Primary Style
                 */
                CustomButton(
                  text: 'Register',
                  color: ChatMeStyles.primaryColor,
                  revertColor: false,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
