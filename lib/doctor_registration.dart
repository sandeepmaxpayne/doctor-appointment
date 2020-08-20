import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
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
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Error must not be empty";
                  } else if (value.length <= 10) {
                    return "Enter a valid mobile number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Error must not be empty";
                  }

                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Upload Degree',
                    labelText: 'Upload Degree',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                keyboardType: TextInputType.multiline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 3,
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
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Error must not be empty";
                  } else if (!value.contains('Freelance') ||
                      !value.contains('Surgeon')) {
                    return "Should write either Freelance or Surgeon";
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
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Successfully validated'),
                    backgroundColor: Colors.green,
                  ));
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
