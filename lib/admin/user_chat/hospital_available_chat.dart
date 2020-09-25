import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/chat_data.dart';
import 'package:doctor_appointment/controller/hospital_form_controller.dart';
import 'package:doctor_appointment/model/hospital_form_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospitalAvailableChat extends StatefulWidget {
  @override
  _HospitalAvailableChatState createState() => _HospitalAvailableChatState();
}

class _HospitalAvailableChatState extends State<HospitalAvailableChat> {
  List<HospitalFormData> hospitalData = List<HospitalFormData>();
  @override
  void initState() {
    super.initState();
    HospitalFormController().getFeedList().then((hospitalData) {
      setState(() {
        this.hospitalData = hospitalData;
        print("PatientsData: ${hospitalData[0].toJson()} ");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Ongoing Chat'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Provider.of<ChatData>(context, listen: false)
                      .changeData(hospitalData[index].mobileNo);
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                title: Row(
                  children: [
                    Icon(Icons.chat),
                    Expanded(
                      child: Text(
                          "${hospitalData[index].hospitalName} - ${hospitalData[index].mobileNo}"),
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
        itemCount: hospitalData.length,
      ),
    );
  }
}
