import 'package:doctor_appointment/borders.dart';
import 'package:doctor_appointment/custom_button.dart';
import 'package:doctor_appointment/custom_text_forn_field.dart';
import 'package:doctor_appointment/home_page.dart';
import 'package:doctor_appointment/screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  String loginEmail;
  String loginPassword;
  final _loginScaffoldKey = GlobalKey<ScaffoldState>();
  bool progress = false;
  final _formKey = GlobalKey<FormState>();

  snackBarMessage(String message, Color color) {
    return _loginScaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
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
                            "SIGN IN",
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
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, SignUpScreen.id),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have and account ?',
                          style: textTheme.body1.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Register',
                          style:
                              textTheme.body1.copyWith(color: Colors.lightBlue),
                        )
                      ],
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
            labelText: 'Email Address',
            border: Borders.outlineBorder,
            validator: (value) {
              if (value.isEmpty) {
                return "Email cannot be empty";
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
                return 'Password cannot be empty';
              }
              return null;
            },
            labelText: 'Password',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  try {
                    if (loginEmail != null) {
                      await auth.sendPasswordResetEmail(email: loginEmail);
                      snackBarMessage('Reset Password sent to your $loginEmail',
                          Colors.green.shade500);
                    } else {
                      snackBarMessage(
                          'Please enter your previous email address',
                          Colors.red.shade500);
                    }
                  } catch (e) {
                    snackBarMessage(
                        loginEmail.isEmpty
                            ? 'Please enter your email !'
                            : e.message,
                        Colors.red);
                  }
                },
                child: Text(
                  "Forgot Password",
                  style: textTheme.body1.copyWith(color: Colors.lightBlue),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomButton(
            elevation: 6.0,
            title: 'Sign In',
            textStyle: textTheme.title.copyWith(color: Colors.black),
            color: Colors.yellow.shade500,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                setState(() {
                  progress = true;
                });

                try {
                  final logUser = await auth.signInWithEmailAndPassword(
                      email: loginEmail, password: loginPassword);
                  if (logUser != null) {
                    setState(() {
                      progress = false;
                    });
                    Navigator.pushNamed(context, Home.id);
                  }
                } catch (e) {
                  setState(() {
                    progress = false;
                  });
                  snackBarMessage(e.message, Colors.red);
                }
              }
            },
          ),
          SizedBox(
            height: 16.0,
          ),
//          _buildSeparator(),
//          SizedBox(
//            height: 16.0,
//          ),
//          CustomButton(
//            title: 'Sign With Google',
//            textStyle: textTheme.title,
//            hasIcon: true,
//            color: Colors.white,
//            elevation: 6.0,
//            onPressed: () {
//              //TODO
//            },
//            icon: Image.asset(
//              "image/google.png",
//              height: 25.0,
//              width: 25.0,
//            ),
//          )
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "OR",
            style: textTheme.title,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Container(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
