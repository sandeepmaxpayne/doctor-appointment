import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/doctor_registration.dart';
import 'package:doctor_appointment/hospita_register.dart';
import 'package:doctor_appointment/patient_registration_form.dart';
import 'package:doctor_appointment/referre.dart';
import 'package:doctor_appointment/screen/login_screen.dart';
import 'package:doctor_appointment/screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(DoctorApp());
}

class DoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFFFb300)),
      initialRoute: LoginScreen.id,
      routes: {
        'home': (context) => Home(),
        'LoginScreen': (context) => LoginScreen(),
        'SignUp': (context) => SignUpScreen(),
        'Referee': (context) => Referee(),
        'PatientForm': (context) => PatientRegistrationForm(),
        'DoctorReg': (context) => DoctorRegister(),
        'HospitalReg': (context) => HospitalRegister(),
        'chat_screen': (context) => ChatScreen(),
      },
    );
  }
}
