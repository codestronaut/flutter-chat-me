import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/chat_page.dart';
import 'package:flutter_chatme/pages/login_page.dart';
import 'package:flutter_chatme/pages/register_page.dart';
import 'package:flutter_chatme/pages/welcome_page.dart';

void main() {
  runApp(ChatMe());
}

class ChatMe extends StatelessWidget {
  const ChatMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => WelcomePage(),
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        ChatPage.routeName: (context) => ChatMe(),
      },
    );
  }
}
