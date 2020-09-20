import 'dart:io';

import 'package:doctor_appointment/controller/doctor_form_controller.dart';
import 'package:doctor_appointment/model/doctor_form_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

class DoctorRegister extends StatelessWidget {
  static const id = 'DoctorReg';

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFb300),
        title: Text(
          'Doctor Registration',
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
  String gender = 'Male';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController freelanceController = TextEditingController();
  String fileType = '';
  String fileName = '';
  String operationText = '';
  String result = '';
  File file;
  bool isUploaded = true;

  Future filePicker(BuildContext context) async {
    try {
      if (fileType == 'others') {
        file = await FilePicker.getFile(
          type: FileType.any,
        );

        fileName = p.basename(file.path);
        setState(() {
          fileName = p.basename(file.path);
        });
        print('file name: $fileName');
        _uploadFile(file, fileName);
      }
    } on PlatformException catch (e) {
      snackBarMessage('Unsupported Exception: $e', Colors.red);
    }
  }

  Future<void> _uploadFile(File file, String fileName) async {
    StorageReference storageReference;

    if (fileType == 'others') {
      storageReference = FirebaseStorage.instance
          .ref()
          .child('degree/${phoneNoController.text}/$fileName');
    }
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print("URL is $url");
    result = url;
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
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
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
                  controller: doctorNameController,
                  keyboardType: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Error must not be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Doctor\'s Name',
                      labelText: 'Doctor\'s Name',
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
                  controller: languageController,
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
                    } else if (value.length < 10) {
                      return "Enter a valid mobile number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
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
                  controller: specializationController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Error must not be empty";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Specialization',
                      labelText: 'Specialization',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  keyboardType: TextInputType.multiline,
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: TextFormField(
//                  controller: degreeController,
//                  validator: (String value) {
//                    if (value.isEmpty) {
//                      return "Error must not be empty";
//                    }
//
//                    return null;
//                  },
//                  decoration: InputDecoration(
//                      hintText: 'Upload Degree',
//                      labelText: 'Upload Degree',
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(5.0),
//                      )),
//                  keyboardType: TextInputType.multiline,
//                ),
//              ),
              ListTile(
                title: Text(
                  'Upload Degree',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.attach_file),
                onTap: () {
                  setState(() {
                    fileType = 'others';
                    print('result: $result');
                    degreeController.text = result;
                  });
                  filePicker(context);
                },
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
                      hintText: 'Reg. Number',
                      labelText: 'Reg. Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: skillController,
                  maxLines: 3,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Error must not be empty";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'skill',
                      labelText: 'skill',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: freelanceController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Error must not be empty";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Willing to do as Freelance or Surgeon',
                      labelText: 'Freelance or Surgeon',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  keyboardType: TextInputType.text,
                ),
              ),
              RaisedButton(
                color: Color(0xFFFFE97D),
                onPressed: () {
                  if (widget._formKey.currentState.validate()) {
                    DoctorFormData feedForm = DoctorFormData(
                      doctorNameController.text,
                      ageController.text,
                      genderController.text,
                      languageController.text,
                      placeController.text,
                      emailController.text,
                      phoneNoController.text,
                      specializationController.text,
                      degreeController.text,
                      regNoController.text,
                      skillController.text,
                      freelanceController.text,
                    );

                    DoctorFormController formController =
                        DoctorFormController();

                    formController.submitForm(feedForm, (String response) {
                      print("response: $response");
                      if (response == DoctorFormController.STATUS_SUCCESS) {
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
                  }
                  Navigator.of(context).pop();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
