import 'package:flutter/material.dart';
import 'package:flutter_chatme/shared/constants.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: ChatMeStyles.primaryColor,
          ),
        ),
      ),
    );
  }
}
