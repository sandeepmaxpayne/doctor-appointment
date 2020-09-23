import 'package:doctor_appointment/controller/hospital_form_controller.dart';
import 'package:doctor_appointment/model/hospital_form_data.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HospitalRegister extends StatelessWidget {
  static const id = 'HospitalReg';

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFb300),
        title: Text(
          'Hospital/Clinic Registration',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: BuildForm(formKey: formKey),
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  TextEditingController otSurgeryController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController specialitiesController = TextEditingController();
  TextEditingController otgChargeController = TextEditingController();

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
                    controller: hospitalNameController,
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Hospital\'s Name',
                        labelText: 'Hospital\'s Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ownerNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Owner Name',
                        labelText: 'Owner Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        )),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: contactPersonController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Contact Person Name',
                        labelText: 'Contact Person Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: mobileNoController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      } else if (value.length != 10) {
                        return "Enter a valid 10 digit mobile number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Phone Number: +91 1234567890',
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
                    controller: regNoController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Registration Number',
                        labelText: 'Registration Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: otSurgeryController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Willing to give OT for surgery?',
                        labelText: 'Willing to give OT for surgery',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: bedController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Willing to give bed for in patient',
                        labelText: 'Willing to give bed for in patient',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: specialitiesController,
                    maxLines: 3,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'specialities',
                        labelText: 'specialities',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: otgChargeController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Error must not be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'OTG Charges in INR',
                        labelText: 'OTG Charges ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
                RaisedButton(
                  color: Color(0xFFFFE97D),
                  onPressed: () {
                    if (widget._formKey.currentState.validate()) {
                      setState(() {
                        progress = true;
                      });
                      HospitalFormData feedForm = HospitalFormData(
                          hospitalNameController.text,
                          ownerNameController.text,
                          contactPersonController.text,
                          mobileNoController.text,
                          emailController.text,
                          regNoController.text,
                          otSurgeryController.text,
                          bedController.text,
                          specialitiesController.text,
                          otgChargeController.text);

                      HospitalFormController formController =
                          HospitalFormController();

                      formController.submitForm(feedForm, (String response) {
                        print("response: $response");
                        if (response == HospitalFormController.STATUS_SUCCESS) {
                          setState(() {
                            progress = !progress;
                          });
                          //data saved successfully in google sheets
                          print(
                              "datata recorded successfully ${feedForm.toJson()}");
                          snackBarMessage(
                              "Data recorded successfully", Colors.green);
                        } else {
                          setState(() {
                            progress = !progress;
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
