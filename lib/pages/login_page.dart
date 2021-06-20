import 'package:flutter/material.dart';
import 'package:flutter_chatme/shared/constants.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 64.0,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashRadius: 20.0,
              icon: Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
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
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      filled: true,
                      fillColor: ChatMeStyles.secondaryTextColor.withAlpha(
                        20,
                      ),
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: ChatMeStyles.secondaryTextColor.withAlpha(
                        20,
                      ),
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: ChatMeStyles.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 200.0,
                      height: 56.0,
                      child: Text(
                        'Login',
                        style: ChatMeStyles.buttonTextStyle,
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
