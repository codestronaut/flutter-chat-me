import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/chat_page.dart';
import 'package:flutter_chatme/pages/login_page.dart';
import 'package:flutter_chatme/pages/register_page.dart';
import 'package:flutter_chatme/pages/utils/loading.dart';
import 'package:flutter_chatme/pages/welcome_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ChatMe();
        }
        return Loading();
      },
    );
  }
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
        ChatPage.routeName: (context) => ChatPage(),
      },
      builder: EasyLoading.init(),
    );
  }
}
