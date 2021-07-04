import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/chat_page.dart';
import 'package:flutter_chatme/pages/widgets/widgets.dart';
import 'package:flutter_chatme/shared/constants.dart';
import 'package:flutter_chatme/shared/validations.dart';
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
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
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
                      validator: (value) =>
                          Validations.validateNotEmpty(value!),
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
                      validator: (value) =>
                          Validations.validateNotEmpty(value!),
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
                      if (_formKey.currentState!.validate()) {
                        EasyLoading.show(status: 'Log In...');
                        try {
                          await _auth.signInWithEmailAndPassword(
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
                            showDialog(
                              context: context,
                              builder: (context) => PopupDialog(
                                image: 'assets/error.png',
                                title: 'User Not Found',
                                titleColor: Color(0xFFE57373),
                                description:
                                    'Please try again with the correct email!',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password!');
                            EasyLoading.dismiss();
                            showDialog(
                              context: context,
                              builder: (context) => PopupDialog(
                                image: 'assets/error.png',
                                title: 'Wrong Password',
                                titleColor: Color(0xFFE57373),
                                description:
                                    'Please try again with the correct password!',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
