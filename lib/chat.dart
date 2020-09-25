import 'package:doctor_appointment/chat_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print('user email" ${loggedInUser.email}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.dashboard),
            tooltip: 'dashboard',
            onPressed: () {
              print('chat Room');
            },
          );
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
//                _auth.signOut();
                Navigator.popAndPushNamed(context, Home.id);
              }),
        ],
        title: Text(
          'Patient Chat Room',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFb300),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFFFb300), width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (messageTextController.text.isNotEmpty) {
                        // print(Provider.of<ChatData>(context, listen: false).phNo);

                        _firestore
                            .collection(
                                Provider.of<ChatData>(context, listen: false)
                                    .phNo)
                            .add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                          // 'time': DateTime.now()
                          'date': DateTime.now().toIso8601String().toString()
                        });
                      }

                      messageTextController.clear();
                    },
                    child: Icon(
                      Icons.send,
                      color: Color(0xFFFFb300),
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

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection(Provider.of<ChatData>(context, listen: false).phNo)
          .orderBy('date')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];

        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final messageTime = message.data['date'];
          final currentUser = loggedInUser.email;
          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
            time: DateTime.parse(messageTime),
          );

          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.sender, this.isMe, this.time});
  final String text;
  final String sender;
  final bool isMe;
  final DateTime time;
  var timeFormat;
  @override
  Widget build(BuildContext context) {
    timeFormat = DateFormat('jm').format(time);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$sender $timeFormat",
            style: TextStyle(color: Colors.black54),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
            elevation: 5.0,
            color: isMe ? Colors.yellow.shade300 : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.black : Colors.black54,
                    fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
