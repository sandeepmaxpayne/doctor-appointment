import 'package:doctor_appointment/doctor_registration.dart';
import 'package:doctor_appointment/hospita_register.dart';
import 'package:doctor_appointment/patient_registration_form.dart';
import 'package:doctor_appointment/referre.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(DoctorApp());
}

class DoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        'home': (context) => Home(),
        'Referee': (context) => Referee(),
        'PatientForm': (context) => PatientRegistrationForm(),
        'DoctorReg': (context) => DoctorRegister(),
        'HospitalReg': (context) => HospitalRegister(),
      },
    );
  }
}
