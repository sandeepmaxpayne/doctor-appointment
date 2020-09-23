import 'package:doctor_appointment/controller/refree_form_controller.dart';
import 'package:doctor_appointment/model/refree_form_data.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Referee extends StatelessWidget {
  static const id = 'Referee';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFb300),
        title: Text('Referred Person'),
        centerTitle: true,
      ),
      body: BuildForm(formKey: formKey),
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String gender = 'Male';
  TextEditingController refererNameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController diagnosisController = new TextEditingController();
  TextEditingController motivatedController = new TextEditingController();
  TextEditingController referrerPhoneNoController = new TextEditingController();
  TextEditingController patientPhoneNoController = new TextEditingController();
  TextEditingController placeController = new TextEditingController();

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
                    controller: refererNameController,
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Name of the referred person',
                        labelText: 'Referrer Name',
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
                        hintText: 'Age of Referrer Person',
                        labelText: 'Referer Age',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: genderController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Sex',
                        labelText: 'Sex',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: diagnosisController,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: motivatedController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Motivated for surgery/admission',
                        labelText: 'Motivated for surgery/admission',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: referrerPhoneNoController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      } else if (value.length != 10) {
                        return "Enter a valid 10 digit mobile number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Referrer Phone Number',
                        labelText: 'Referrer Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: patientPhoneNoController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      } else if (value.length != 10) {
                        return "Enter a valid 10 digit mobile number";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Phone no of Patient',
                        labelText: 'Phone no of Patient',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.number,
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
                        hintText: 'place',
                        labelText: 'place',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                RaisedButton(
                  color: Color(0xFFFFE97D),
                  onPressed: () {
                    if (widget._formKey.currentState.validate()) {
                      setState(() {
                        progress = true;
                      });
                      RefreeForm refreeForm = RefreeForm(
                          refererNameController.text,
                          ageController.text,
                          genderController.text,
                          diagnosisController.text,
                          motivatedController.text,
                          referrerPhoneNoController.text,
                          patientPhoneNoController.text,
                          placeController.text);
                      RefreeController refreeController = RefreeController();
                      refreeController.submitForm(refreeForm,
                          (String response) {
                        print("response: $response");
                        if (response == RefreeController.STATUS_SUCCESS) {
                          setState(() {
                            progress = !progress;
                          });
                          print(
                              "Data recorded successfully: ${refreeForm.toJson()}");
                          snackBarMessage(
                              "Data recorded successfully", Colors.green);
                          // sleep(const Duration(seconds: 4));
                          //  Navigator.pop(context);
                        } else {
                          setState(() {
                            progress = !progress;
                          });
                          print("Error saving data");
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
