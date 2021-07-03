import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/chat_page.dart';
import 'package:flutter_chatme/pages/widgets/widgets.dart';
import 'package:flutter_chatme/shared/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

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
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: _password,
                    obscureText: true,
                    decoration: ChatMeStyles.kTextFieldDecoration.copyWith(
                      hintText: 'Password',
                    ),
                  ),
                ),
                /**
                 * Login Button
                 * Primary Style
                 */
                CustomButton(
                  text: 'Login',
                  color: ChatMeStyles.primaryColor,
                  revertColor: false,
                  onPressed: () async {
                    EasyLoading.show(status: 'Log In...');
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                        email: _email.text,
                        password: _password.text,
                      );

                      Navigator.pushReplacementNamed(
                        context,
                        ChatPage.routeName,
                      );

                      EasyLoading.dismiss();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('User not found!');
                        EasyLoading.dismiss();
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password!');
                        EasyLoading.dismiss();
                        Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: 65.0,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.close,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(height: 10.0),
                                Text('Wrong Password'),
                                SizedBox(height: 10.0),
                                CustomButton(
                                  text: 'Ok',
                                  color: ChatMeStyles.primaryColor,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
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
