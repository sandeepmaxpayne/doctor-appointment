import 'package:doctor_appointment/admin/style_const.dart';
import 'package:doctor_appointment/model/patient_form_data.dart';
import 'package:flutter/material.dart';

class PatientAllDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PatientFormData patientFormData =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Patient Name: ${patientFormData.patientName}",
              style: kTextStyle,
            ),
            Text(
              "Age: ${patientFormData.age}",
              style: kTextStyle,
            ),
            Text(
              "Gender: ${patientFormData.gender}",
              style: kTextStyle,
            ),
            Text(
              "Language: ${patientFormData.lang}",
              style: kTextStyle,
            ),
            Text(
              "Place: ${patientFormData.place}",
              maxLines: 3,
              style: kTextStyle,
            ),
            Text(
              "Email: ${patientFormData.email}",
              style: kTextStyle,
            ),
            Text(
              "Phone No: ${patientFormData.phoneNo}",
              style: kTextStyle,
            ),
            Text(
              "Complaint: ${patientFormData.complaint}",
              style: kTextStyle,
            ),
            Text(
              "Investigation: ${patientFormData.investigation}",
              style: kTextStyle,
            ),
            Text(
              "Diagnosis: ${patientFormData.diagnosis}",
              style: kTextStyle,
            ),
            Text(
              "Surgery Advise: ${patientFormData.surgeryAdvise}",
              style: kTextStyle,
            ),
            Text(
              "Start Budget: ${patientFormData.startBudget}",
              style: kTextStyle,
            ),
            Text(
              "End Budget: ${patientFormData.endBudget}",
              style: kTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
