import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/chat_data.dart';
import 'package:doctor_appointment/controller/patient_form_controller.dart';
import 'package:doctor_appointment/model/patient_form_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvailableChat extends StatefulWidget {
  @override
  _AvailableChatState createState() => _AvailableChatState();
}

class _AvailableChatState extends State<AvailableChat> {
  List<PatientFormData> patientData = List<PatientFormData>();
  @override
  void initState() {
    super.initState();
    PatientFormController().getFeedList().then((patientData) {
      setState(() {
        this.patientData = patientData;
        print("PatientsData: ${patientData[0].toJson()} ");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing Chat'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Provider.of<ChatData>(context)
                      .changeData(patientData[index].phoneNo);
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                title: Row(
                  children: [
                    Icon(Icons.chat),
                    Expanded(
                      child: Text(
                          "${patientData[index].patientName} - ${patientData[index].phoneNo}"),
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
        itemCount: patientData.length,
      ),
    );
  }
}
