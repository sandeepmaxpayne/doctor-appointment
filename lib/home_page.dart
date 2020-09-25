import 'package:doctor_appointment/admin_access/admin_login_screen.dart';
import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/chat_data.dart';
import 'package:doctor_appointment/controller/patient_form_controller.dart';
import 'package:doctor_appointment/doctor_registration.dart';
import 'package:doctor_appointment/hospita_register.dart';
import 'package:doctor_appointment/patient_registration_form.dart';
import 'package:doctor_appointment/referre.dart';
import 'package:doctor_appointment/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'model/patient_form_data.dart';

class Home extends StatefulWidget {
  static final id = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController userMobNo = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<PatientFormData> patientData = List<PatientFormData>();
  List<String> phoneList = List();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    PatientFormController().getFeedList().then((patientData) {
      setState(() {
        this.patientData = patientData;
        print("PatientsData: ${patientData[0].toJson()} ");
      });
    });
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print('user email" ${loggedInUser.email}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, AdminLoginScreen.id),
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          )
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Color(0xFFFFB74D),
                image: DecorationImage(
                    image: AssetImage("image/logo.png"), fit: BoxFit.fill),
              ),
            ),
            ListTile(
              title: Text('Notification'),
              leading: Icon(
                Icons.notifications,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('share'),
              leading: Icon(Icons.share),
              onTap: () {
                Share.share('new app link');
              },
            ),
            ListTile(
              title: Text('contact'),
              leading: Icon(Icons.contact_phone),
              onTap: () {},
            ),
            ListTile(
              title: Text('Public Policy'),
              leading: Icon(Icons.security),
              onTap: () {},
            ),
            ListTile(
              title: Text('Chat with Admin'),
              leading: Icon(Icons.chat),
              onTap: () => _showDialog(),
            ),
            ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  _auth.signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                })
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text("Register",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600)),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HospitalRegister.id);
            },
            color: Color(0xFFFFE97D),
            child: Text("Hospital"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(DoctorRegister.id);
            },
            color: Color(0xFFFFE97D),
            child: Text("Doctor"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(PatientRegistrationForm.patient_form);
            },
            color: Color(0xFFFFE97D),
            child: Text("Patient"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Referee.id);
            },
            color: Color(0xFFFFE97D),
            child: Text("Referred Person"),
          ),
        ],
      )),
    );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: _SystemPadding(
        child: AlertDialog(
          elevation: 5.0,
          contentPadding: EdgeInsets.all(16.0),
          content: Row(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This cannot be empty !";
                      } else if (value.length != 10) {
                        return "Enter your 10 digit mobile No to Chat";
                      }
                      return null;
                    },
                    controller: userMobNo,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Mobile No',
                        hintText: 'Enter your Registered Mobile No',
                        hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.black45)),
                  ),
                ),
              )
            ],
          ),
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('OPEN'),
              onPressed: () {
                for (var i = 0; i < patientData.length - 1; i++) {
                  print(patientData[i].phoneNo);
                  phoneList.add(patientData[i].phoneNo);
                }
                print("PatientsData: $phoneList");
                if (_formKey.currentState.validate()) {
                  if (phoneList.contains(userMobNo.text)) {
                    Provider.of<ChatData>(context, listen: false)
                        .changeData(userMobNo.text);
                    Navigator.pushNamed(context, ChatScreen.id);
                  } else {
                    Navigator.pop(context);
                  }
                  // Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;
  _SystemPadding({this.child});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return AnimatedContainer(
      padding: mediaQuery.viewInsets,
      duration: Duration(milliseconds: 300),
      child: child,
    );
  }
}
