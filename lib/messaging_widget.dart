import 'package:doctor_appointment/message_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = List();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
              title: notification['title'], body: notification['body']));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        setState(() {
          messages.add(Message(title: '$message', body: 'launch'));
        });
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
              title: 'on launch ${notification['title']}',
              body: 'on launch ${notification['body']}'));
        });
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Notification'),
      ),
      body: ListView(
        children: messages.map(buildMessage).toList(),
      ),
    );
  }

  Widget buildMessage(Message msg) {
    return ListTile(
      title: Text(msg.title),
      subtitle: Text(msg.body),
    );
  }
}
