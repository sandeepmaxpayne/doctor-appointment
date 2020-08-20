import 'package:flutter/material.dart';

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
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Error must not be empty";
                  } else if (value.length <= 10) {
                    return "Enter a valid mobile number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Referrer Phone Number',
                    labelText: 'Referrer Phone Number',
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
                    hintText: 'Phone no of Patient',
                    labelText: 'Phone no of Patient',
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
