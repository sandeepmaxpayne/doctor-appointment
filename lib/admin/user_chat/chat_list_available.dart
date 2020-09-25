import 'package:doctor_appointment/admin/user_chat/card_view.dart';
import 'package:doctor_appointment/admin/user_chat/docotor_available_chat.dart';
import 'package:doctor_appointment/admin/user_chat/hospital_available_chat.dart';
import 'package:doctor_appointment/admin/user_chat/patient_available_chat.dart';
import 'package:doctor_appointment/admin/user_chat/referer_available_chat.dart';
import 'package:flutter/material.dart';

class AvailableChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Chat'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          ChatCard(
            title1: 'Patient Chat',
            title2: 'Chat with recent patients',
            desc: 'List of Patient Chats Available',
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientAvailableChat()));
            },
          ),
          ChatCard(
            title1: 'Doctor Chat',
            title2: 'Chat with the registered doctors',
            desc: 'List of Doctor Chats Available',
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorAvailableChat()));
            },
          ),
          ChatCard(
              title1: 'Hospital Chat',
              title2: 'Chat with the registered hospital users',
              desc: 'List of Registered Hospitals users available',
              onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HospitalAvailableChat()))),
          ChatCard(
            title1: 'Referer Chat',
            title2: 'Chat with the referer person',
            desc: 'List of all referer users available',
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RefererAvailableChat()));
            },
          ),
        ],
      ),
    );
  }
}
