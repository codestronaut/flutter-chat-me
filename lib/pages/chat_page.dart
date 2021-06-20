import 'package:flutter/material.dart';
import 'package:flutter_chatme/shared/constants.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChatMeStyles.secondaryColor,
      body: Text('Chat!'),
    );
  }
}
