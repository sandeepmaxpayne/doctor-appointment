import 'package:doctor_appointment/admin/dashboard.dart';
import 'package:doctor_appointment/borders.dart';
import 'package:doctor_appointment/custom_button.dart';
import 'package:doctor_appointment/custom_text_forn_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AdminLoginScreen extends StatefulWidget {
  static const id = "AdminScreen";

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

const String adminEmail = "admin@gmail.com";

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final auth = FirebaseAuth.instance;
  String loginEmail;
  String loginPassword;
  final _loginScaffoldKey = GlobalKey<ScaffoldState>();
  bool progress = false;
  final _formKey = GlobalKey<FormState>();

  snackBarMessage(String message, Color color) {
    return _loginScaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      backgroundColor: color,
      behavior: SnackBarBehavior.fixed,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: _loginScaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: progress,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: heightOfScreen * 0.15,
                  ),
                  Expanded(
                    child: Center(
                      child: ListView(
                        children: [
                          Text(
                            "ADMIN LOGIN",
                            textAlign: TextAlign.center,
                            style: textTheme.headline,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _buildForm()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    var textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textInputType: TextInputType.emailAddress,
            labelText: 'Admin Email',
            border: Borders.outlineBorder,
            validator: (value) {
              if (value.isEmpty) {
                return "INVALID EMAIL";
              }
              return null;
            },
            onChanged: (value) {
              loginEmail = value;
            },
            enabledBorder: Borders.outlineEnabledBorder,
            focusedBorder: Borders.outlineFocusedBorder,
            labelTextStyle: GoogleFonts.comfortaa(
              fontSize: 16.0,
              color: Color(0xFF2F2F2F),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            hintTextStyle: GoogleFonts.comfortaa(
              fontSize: 16.0,
              color: Color(0xFF2F2F2F),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            textStyle: GoogleFonts.comfortaa(
              fontSize: 16.0,
              color: Color(0xFF2F2F2F),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            textInputType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return 'INVALID PASSWORD';
              }
              return null;
            },
            labelText: 'Admin Password',
            obscured: true,
            onChanged: (value) {
              loginPassword = value;
            },
            border: Borders.outlineBorder,
            enabledBorder: Borders.outlineEnabledBorder,
            focusedBorder: Borders.outlineFocusedBorder,
            labelTextStyle: GoogleFonts.comfortaa(
              fontSize: 16.0,
              color: Color(0xFF2F2F2F),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            hintTextStyle: GoogleFonts.comfortaa(
              fontSize: 16.0,
              color: Color(0xFF2F2F2F),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            textStyle: GoogleFonts.comfortaa(
              fontSize: 16.0,
              color: Color(0xFF2F2F2F),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomButton(
            elevation: 6.0,
            title: 'ADMIN LOGIN',
            textStyle: textTheme.title.copyWith(color: Colors.black),
            color: Colors.yellow.shade500,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                setState(() {
                  progress = true;
                });
                if (adminEmail == loginEmail) {
                  try {
                    final logUser = await auth.signInWithEmailAndPassword(
                        email: loginEmail, password: loginPassword);
                    if (logUser != null) {
                      setState(() {
                        progress = false;
                      });

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    }
                  } catch (e) {
                    setState(() {
                      progress = false;
                    });
                    snackBarMessage(e.message, Colors.red);
                  }
                } else {
                  setState(() {
                    progress = false;
                  });
                  snackBarMessage("INVALID ADMIN EMAIL!", Colors.red);
                }
              }
            },
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
