import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatme/pages/welcome_page.dart';
import 'package:flutter_chatme/pages/widgets/widgets.dart';
import 'package:flutter_chatme/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

enum Menu { logout }

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late User loggedInUser;
  TextEditingController _message = TextEditingController();

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      elevation: 1.0,
      items: [
        PopupMenuItem<Menu>(
          value: Menu.logout,
          child: Text(
            'Logout',
          ),
        ),
      ],
    ).then((value) {
      if (value == Menu.logout) {
        _auth.signOut();
        Navigator.pushReplacementNamed(
          context,
          WelcomePage.routeName,
        );
      }
    });
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Chat',
          style: GoogleFonts.nunitoSans(
            color: ChatMeStyles.secondaryColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: ChatMeStyles.secondaryColor,
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 10.0,
            ),
            child: GestureDetector(
              onTapDown: (TapDownDetails details) {
                showPopupMenu(details.globalPosition);
              },
              child: Container(
                height: 36.0,
                width: 36.0,
                decoration: BoxDecoration(
                  color: ChatMeStyles.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    loggedInUser.email![0].toUpperCase(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessagesStream(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: ChatMeStyles.primaryColor,
                    width: 1.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        16.0,
                        12.0,
                        8.0,
                        16.0,
                      ),
                      child: TextFormField(
                        controller: _message,
                        decoration: ChatMeStyles.kTextFieldDecoration.copyWith(
                          hintText: 'Type message..',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        8.0,
                        12.0,
                        16.0,
                        16.0,
                      ),
                      child: RawMaterialButton(
                        padding: EdgeInsets.all(12.0),
                        fillColor: ChatMeStyles.primaryColor,
                        elevation: 0.0,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _firestore.collection('messages').add({
                            'sender': _auth.currentUser!.email,
                            'text': _message.text,
                          });
                          _message.clear();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot?>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: ChatMeStyles.primaryColor,
            ),
          );
        }

        final messages = snapshot.data?.docs;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages!) {
          final data = message.data() as Map<String, dynamic>;
          final sender = data['sender'];
          final text = data['text'];

          final messageBubble = MessageBubble(
            sender: sender.split('@')[0],
            text: text,
            isMe: sender == _auth.currentUser?.email,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: Container(
            color: ChatMeStyles.backgroundColor,
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              children: messageBubbles,
            ),
          ),
        );
      },
    );
  }
}
