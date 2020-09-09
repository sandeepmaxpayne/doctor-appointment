import 'package:doctor_appointment/borders.dart';
import 'package:doctor_appointment/controller/form_controller.dart';
import 'package:doctor_appointment/custom_button.dart';
import 'package:doctor_appointment/home_page.dart';
import 'package:doctor_appointment/model/forms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../custom_text_forn_field.dart';

class SignUpScreen extends StatefulWidget {
  static const id = "SignUp";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String registerEmail;
  String registerPassword;
  final _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showSpinner = false;
  String phoneNo;
  String firstName, lastName;
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  _verify() {
    return _formKey.currentState.validate();
  }

  snackBarMessage(String message, Color color) {
    return _scaffoldKey.currentState.showSnackBar(SnackBar(
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
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                            "Register",
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
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already Registered?',
                          style: textTheme.body1.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Log In',
                          style: textTheme.body1.copyWith(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextFormField(
                width: (widthOfScreen / 2) - 24.0,
                textInputType: TextInputType.text,
                labelText: "First Name",
                controller: fnameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "First Name Required";
                  }
                  return null;
                },
                onChanged: (value) {
                  firstName = value;
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
                width: 16.0,
              ),
              CustomTextFormField(
                width: (widthOfScreen / 2) - 24.0,
                textInputType: TextInputType.text,
                labelText: "Last Name",
                controller: lnameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Last Name Required';
                  }
                  return null;
                },
                onChanged: (value) {
                  lastName = value;
                  print("lname: ${lnameController.text} lastname: $lastName");
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
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            textInputType: TextInputType.emailAddress,
            labelText: "Email Address",
            onChanged: (value) {
              registerEmail = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "Email cannot be empty";
              }
              return null;
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
            height: 20.0,
          ),
          CustomTextFormField(
            textInputType: TextInputType.text,
            labelText: 'Password',
            validator: (value) {
              if (value.isEmpty) {
                return "Password cannot be empty";
              }
              return null;
            },
            onChanged: (value) {
              registerPassword = value;
            },
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
            obscured: true,
            border: Borders.outlineBorder,
            enabledBorder: Borders.outlineEnabledBorder,
            focusedBorder: Borders.outlineFocusedBorder,
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            controller: mobileNoController,
            validator: (String value) {
              if (value.isEmpty) {
                return "Phone number is mandatory";
              } else if (value.length < 10) {
                return "Enter a valid phone number";
              }

              return null;
            },
            textInputType: TextInputType.phone,
            labelText: "Phone Number",
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
            height: 20.0,
          ),
          CustomButton(
            title: 'Register',
            textStyle: textTheme.title.copyWith(color: Colors.black),
            color: Colors.yellow.shade500,
            onPressed: () async {
              if (_verify()) {
                FeedForm feedForm = FeedForm(fnameController.text,
                    lnameController.text, mobileNoController.text);

                FormController formController = FormController();

                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.createUserWithEmailAndPassword(
                      email: registerEmail, password: registerPassword);
                  //store data to sheet
                  formController.submitForm(feedForm, (String response) {
                    print("response: $response");
                    if (response == FormController.STATUS_SUCCESS) {
                      //data saved successfully in google sheets
                      print(
                          "datata recorded successfully ${feedForm.toJson()}");
                      snackBarMessage(
                          "Data recorded successfully", Colors.green);
                    } else {
                      print("error saving data");
                      snackBarMessage("Error Saving Data!", Colors.red);
                    }
                  });

                  if (user != null) {
                    setState(() {
                      showSpinner = false;
                    });
                    Navigator.pushNamed(context, Home.id);
                  }
                } catch (e) {
                  setState(() {
                    showSpinner = false;
                  });
                  snackBarMessage(e.message, Colors.red);
                }
              }
            },
            elevation: 6.0,
          ),
        ],
      ),
    );
  }
}
