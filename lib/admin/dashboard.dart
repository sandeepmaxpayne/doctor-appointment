import 'package:doctor_appointment/admin/available_chat.dart';
import 'package:doctor_appointment/admin/patientdetail_screen.dart';
import 'package:doctor_appointment/admin/refree_screen.dart';
import 'package:doctor_appointment/admin/registerDoctorDetail_screen.dart';
import 'package:doctor_appointment/admin/registerHospitalDetail_screen.dart';
import 'package:doctor_appointment/admin/style_const.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AllPatientDetailScreen.id);
            },
            color: Color(0xFFFFE97D),
            child: Text(
              "Patient",
              style: kTextStyle,
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AllRegisterDoctorScreen.id);
            },
            color: Color(0xFFFFE97D),
            child: Text(
              "Doctors",
              style: kTextStyle,
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AllHospitalDetails.id);
            },
            color: Color(0xFFFFE97D),
            child: Text(
              "Hospitals",
              style: kTextStyle,
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RefreeScreen.id);
            },
            color: Color(0xFFFFE97D),
            child: Text(
              "Referer",
              style: kTextStyle,
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AvailableChat()));
            },
            color: Color(0xFFFFE97D),
            child: Text(
              "Available Chat",
              style: kTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
