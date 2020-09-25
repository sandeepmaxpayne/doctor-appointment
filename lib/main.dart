import 'package:doctor_appointment/admin/registerDoctorDetail_screen.dart';
import 'package:doctor_appointment/admin/registerHospitalDetail_screen.dart';
import 'package:doctor_appointment/admin/user_chat/chat_list_available.dart';
import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/chat_data.dart';
import 'package:doctor_appointment/doctor_registration.dart';
import 'package:doctor_appointment/hospita_register.dart';
import 'package:doctor_appointment/messaging_widget.dart';
import 'package:doctor_appointment/patient_registration_form.dart';
import 'package:doctor_appointment/referre.dart';
import 'package:doctor_appointment/screen/login_screen.dart';
import 'package:doctor_appointment/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin/patientdetail_screen.dart';
import 'admin/refree_screen.dart';
import 'admin_access/admin_login_screen.dart';
import 'home_page.dart';

void main() {
  runApp(DoctorApp());
}

class DoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatData>(
      create: (context) => ChatData(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Color(0xFFFFb300)),
        initialRoute: LoginScreen.id,
        //  home: MessagingWidget(),
//      home: AllRegisterDoctorScreen(),
        // home: AllPatientDetailScreen(),
        //  home: RefreeScreen(),
        //   home: AdminLoginScreen(),
        //   home: Dashboard(),
        routes: {
          //Local User Screen
          'home': (context) => Home(),
          'LoginScreen': (context) => LoginScreen(),
          'SignUp': (context) => SignUpScreen(),
          'Referee': (context) => Referee(),
          'PatientForm': (context) => PatientRegistrationForm(),
          'DoctorReg': (context) => DoctorRegister(),
          'HospitalReg': (context) => HospitalRegister(),
          'chat_screen': (context) => ChatScreen(),
          //Admin Screen
          'AdminScreen': (context) => AdminLoginScreen(),
          'AdminRefreeScreen': (context) => RefreeScreen(),
          'AdminHospitalScreeen': (context) => AllHospitalDetails(),
          'AdminRegisterDoctorScreen': (context) => AllRegisterDoctorScreen(),
          'AdminPatientScreen': (context) => AllPatientDetailScreen()
        },
      ),
    );
  }
}
