import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/chat_data.dart';
import 'package:doctor_appointment/controller/refree_form_controller.dart';
import 'package:doctor_appointment/model/refree_form_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RefererAvailableChat extends StatefulWidget {
  @override
  _RefererAvailableChatState createState() => _RefererAvailableChatState();
}

class _RefererAvailableChatState extends State<RefererAvailableChat> {
  List<RefreeForm> refererData = List<RefreeForm>();
  @override
  void initState() {
    super.initState();
    RefreeController().getFeedList().then((refererData) {
      setState(() {
        this.refererData = refererData;
        print("PatientsData: ${refererData[0].toJson()} ");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Ongoing Chat'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Provider.of<ChatData>(context)
                      .changeData(refererData[index].referrerPhoneNo);
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                title: Row(
                  children: [
                    Icon(Icons.chat),
                    Expanded(
                      child: Text(
                          "${refererData[index].refererName} - ${refererData[index].referrerPhoneNo}"),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
              )
            ],
          );
        },
        itemCount: refererData.length,
      ),
    );
  }
}
