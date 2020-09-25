import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/chat_data.dart';
import 'package:doctor_appointment/controller/doctor_form_controller.dart';
import 'package:doctor_appointment/model/doctor_form_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorAvailableChat extends StatefulWidget {
  @override
  _DoctorAvailableChatState createState() => _DoctorAvailableChatState();
}

class _DoctorAvailableChatState extends State<DoctorAvailableChat> {
  List<DoctorFormData> doctorData = List<DoctorFormData>();
  @override
  void initState() {
    super.initState();
    DoctorFormController().getFeedList().then((doctorData) {
      setState(() {
        this.doctorData = doctorData;
        print("PatientsData: ${doctorData[0].toJson()} ");
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
                  Provider.of<ChatData>(context, listen: false)
                      .changeData(doctorData[index].phoneNo);
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                title: Row(
                  children: [
                    Icon(Icons.chat),
                    Expanded(
                      child: Text(
                          "${doctorData[index].doctorName} - ${doctorData[index].phoneNo}"),
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
        itemCount: doctorData.length,
      ),
    );
  }
}
