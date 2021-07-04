import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/chat_page.dart';
import 'package:flutter_chatme/pages/widgets/widgets.dart';
import 'package:flutter_chatme/shared/constants.dart';
import 'package:flutter_chatme/shared/validations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                          Validations.validatePassword(value!),
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
                    onPressed: () async {
                      EasyLoading.show(status: 'Please Wait');
                      try {
                        await _auth.createUserWithEmailAndPassword(
                          email: _email.text,
                          password: _password.text,
                        );

                        Navigator.pushReplacementNamed(
                          context,
                          ChatPage.routeName,
                        );

                        EasyLoading.dismiss();
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          EasyLoading.dismiss();
                          showDialog(
                            context: context,
                            builder: (context) => PopupDialog(
                              image: 'assets/error.png',
                              title: 'Weak Password',
                              titleColor: Color(0xFFE57373),
                              description:
                                  'Please try again with the strongest password!',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        } else if (e.code == 'email-already-in-use') {
                          EasyLoading.dismiss();
                          showDialog(
                            context: context,
                            builder: (context) => PopupDialog(
                              image: 'assets/error.png',
                              title: 'Email Already Used',
                              titleColor: Color(0xFFE57373),
                              description:
                                  'Please try again with different email!',
                              onPressed: () {
                                Navigator.pop(context);
                              },
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
          ),
        ],
      ),
    );
  }
}
