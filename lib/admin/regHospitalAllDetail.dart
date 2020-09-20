import 'package:doctor_appointment/admin/style_const.dart';
import 'package:doctor_appointment/model/hospital_form_data.dart';
import 'package:flutter/material.dart';

class HospitalAllDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HospitalFormData hospitalFormData =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hospital Name: ${hospitalFormData.hospitalName}",
              style: kTextStyle,
            ),
            Text(
              "Owner Name: ${hospitalFormData.ownerName}",
              style: kTextStyle,
            ),
            Text(
              "Contact Person: ${hospitalFormData.contactPerson}",
              style: kTextStyle,
            ),
            Text(
              "Mobile No: ${hospitalFormData.mobileNo}",
              style: kTextStyle,
            ),
            Text(
              "Email: ${hospitalFormData.email}",
              style: kTextStyle,
            ),
            Text(
              "Registration No: ${hospitalFormData.regNo}",
              style: kTextStyle,
            ),
            Text(
              "Ot Surgery: ${hospitalFormData.otSurgery}",
              maxLines: 4,
              style: kTextStyle,
            ),
            Text(
              "bed: ${hospitalFormData.bed}",
              style: kTextStyle,
            ),
            Text(
              "Specialities: ${hospitalFormData.specialities}",
              style: kTextStyle,
              maxLines: 4,
            ),
            Text(
              "Otg Charge: ${hospitalFormData.otgCharge}",
              style: kTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
