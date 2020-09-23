import 'package:doctor_appointment/chat.dart';
import 'package:doctor_appointment/chat_data.dart';
import 'package:doctor_appointment/controller/patient_form_controller.dart';
import 'package:doctor_appointment/model/patient_form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class PatientRegistrationForm extends StatefulWidget {
  static const patient_form = "PatientForm";
  @override
  _PatientRegistrationFormState createState() =>
      _PatientRegistrationFormState();
}

class _PatientRegistrationFormState extends State<PatientRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Patient Registration',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: BuildForm(formKey: _formKey),
        ),
      ),
    );
  }
}

class BuildForm extends StatefulWidget {
  const BuildForm({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  String gender = 'Male';
  var selectedRange = RangeValues(200, 5000);
  int currentSliderValue = 250;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController langController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController complaintController = TextEditingController();
  TextEditingController investigationController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController surgeryAdviseController = TextEditingController();
  TextEditingController startBudgetController = TextEditingController();
  TextEditingController endBudgetController = TextEditingController();

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

  bool progress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: progress,
        child: Form(
          key: widget._formKey,
          child: SingleChildScrollView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: patientNameController,
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Patient\'s Name',
                        labelText: 'Patient\'s Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ageController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Age',
                        labelText: 'Age',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        )),
                  ),
                ),
                Center(
                  child: DropdownButton<String>(
                    onChanged: (String newValue) {
                      setState(() {
                        gender = newValue;
                        genderController.text = newValue;
                        print('gender: $gender');
                      });
                    },
                    value: gender,
                    items: ['Male', 'Female']
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                  onTap: () {
                                    print('value: $e');
                                  },
                                ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: langController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Language',
                        labelText: 'Language',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: placeController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Place/District/State',
                        labelText: 'Place/District/State',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phoneNoController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      } else if (value.length != 10) {
                        return "Enter a valid 10 digit mobile number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: complaintController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Complaint',
                        labelText: 'Complaint',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: investigationController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Investigation',
                        labelText: 'Investigation',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: diagnosisController,
                    maxLines: 3,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Diagnosis',
                        labelText: 'Diagnosis',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: surgeryAdviseController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Surgery Advised',
                        labelText: 'Surgery Advised',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                RangeSlider(
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      selectedRange = newRange;
                      startBudgetController.text =
                          selectedRange.start.toString();
                      endBudgetController.text = selectedRange.end.toString();
                      print('selected range: $selectedRange');
                    });
                  },
                  min: 200.0,
                  max: 5000.0,
                  divisions: 100,
                  values: selectedRange,
                  activeColor: Theme.of(context).primaryColor,
                  labels: RangeLabels('\u20B9${selectedRange.start}',
                      '\u20B9${selectedRange.end}'),
                ),
                RaisedButton(
                  color: Color(0xFFFFE97D),
                  onPressed: () {
                    if (widget._formKey.currentState.validate()) {
                      setState(() {
                        progress = true;
                      });
                      PatientFormData patientForm = PatientFormData(
                          patientNameController.text,
                          ageController.text,
                          genderController.text,
                          langController.text,
                          placeController.text,
                          emailController.text,
                          phoneNoController.text,
                          complaintController.text,
                          investigationController.text,
                          diagnosisController.text,
                          surgeryAdviseController.text,
                          startBudgetController.text,
                          endBudgetController.text);

                      PatientFormController patientFormController =
                          PatientFormController();

                      patientFormController.submitForm(patientForm,
                          (String response) {
                        print("response: $response");
                        if (response == PatientFormController.STATUS_SUCCESS) {
                          setState(() {
                            progress = false;
                          });
                          //data saved successfully in google sheets
                          print(
                              "data recorded successfully ${patientForm.toJson()}");
                          snackBarMessage(
                              "Data recorded successfully", Colors.green);

                          ///Redirect to chat
                          Provider.of<ChatData>(context, listen: false)
                              .changeData(patientForm.phoneNo);
                          Navigator.pushNamed(context, ChatScreen.id);
                        } else {
                          setState(() {
                            progress = false;
                          });
                          print("error saving data");
                          snackBarMessage("Error Saving Data!", Colors.red);
                        }
                      });
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
