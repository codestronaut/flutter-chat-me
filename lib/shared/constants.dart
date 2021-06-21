import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMeStyles {
  static const primaryColor = Color(0xFF00BCD4);
  static const secondaryColor = Color(0xFF252836);
  static const backgroundColor = Color(0xFFF5F5F7);
  static const primaryTextColor = Color(0xFFFFFFFF);
  static const secondaryTextColor = Color(0xFFF5F5F7);

  static var buttonTextStyle = GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
  );

  static var sendButtonTextStyle = GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );

  static const messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    hintText: 'Type a message',
    border: InputBorder.none,
  );

  static const messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(
        color: Colors.lightBlue,
        width: 2.0,
      ),
    ),
  );

  static const kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: secondaryTextColor,
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
  );
}
