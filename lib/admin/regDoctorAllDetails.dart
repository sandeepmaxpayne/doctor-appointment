import 'package:doctor_appointment/admin/style_const.dart';
import 'package:doctor_appointment/model/doctor_form_data.dart';
import 'package:flutter/material.dart';

class DoctorAllDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DoctorFormData doctorFormData =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Doctor Name: ${doctorFormData.doctorName}",
                style: kTextStyle,
              ),
              Text(
                "Age: ${doctorFormData.age}",
                style: kTextStyle,
              ),
              Text(
                "Gender: ${doctorFormData.gender}",
                style: kTextStyle,
              ),
              Text(
                "Language: ${doctorFormData.language}",
                style: kTextStyle,
              ),
              Text(
                "Place: ${doctorFormData.place}",
                maxLines: 3,
                style: kTextStyle,
              ),
              Text(
                "Email: ${doctorFormData.email}",
                style: kTextStyle,
              ),
              Text(
                "Phone No: ${doctorFormData.phoneNo}",
                style: kTextStyle,
              ),
              Text(
                "Specialization: ${doctorFormData.specialization}",
                style: kTextStyle,
              ),
              TextFormField(
                initialValue: "Degree: ${doctorFormData.degree}",
                style: kTextStyle,
                maxLines: 6,
              ),
              Image.network(
                "${doctorFormData.degree}",
                fit: BoxFit.scaleDown,
              ),
              Text(
                "Registration Number: ${doctorFormData.regNo}",
                style: kTextStyle,
              ),
              Text(
                "Skill: ${doctorFormData.skill}",
                style: kTextStyle,
              ),
              Text(
                "Freelance: ${doctorFormData.freelance}",
                style: kTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
