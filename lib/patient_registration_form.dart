import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  print('selected range: $selectedRange');
                });
              },
              min: 200.0,
              max: 5000.0,
              divisions: 100,
              values: selectedRange,
              activeColor: Colors.blueAccent,
              labels: RangeLabels(
                  '\u20B9${selectedRange.start}', '\u20B9${selectedRange.end}'),
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
