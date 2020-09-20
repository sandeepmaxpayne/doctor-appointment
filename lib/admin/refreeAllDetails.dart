import 'package:doctor_appointment/admin/style_const.dart';
import 'package:doctor_appointment/model/refree_form_data.dart';
import 'package:flutter/material.dart';

class RefreeAllDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RefreeForm refreeFormData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Referer Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Referer Name: ${refreeFormData.refererName}",
              style: kTextStyle,
            ),
            Text(
              "Age: ${refreeFormData.age}",
              style: kTextStyle,
            ),
            Text("Sex: ${refreeFormData.gender}"),
            Text(
              "Diagnosis: ${refreeFormData.diagnosis}",
              style: kTextStyle,
            ),
            Text(
              "Motivated: ${refreeFormData.motivated}",
              style: kTextStyle,
            ),
            Text(
              "Place: ${refreeFormData.place}",
              style: kTextStyle,
            ),
            Text(
              "Patient PhNo: ${refreeFormData.patientPhoneNo}",
              style: kTextStyle,
            ),
            Text(
              "Referrer PhoneNo: ${refreeFormData.referrerPhoneNo}",
              style: kTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
