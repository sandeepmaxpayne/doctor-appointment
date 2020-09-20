import 'package:doctor_appointment/admin/patientAllDetails.dart';
import 'package:doctor_appointment/controller/patient_form_controller.dart';
import 'package:doctor_appointment/model/patient_form_data.dart';
import 'package:flutter/material.dart';

class AllPatientDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Patient Details'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: RegisteredPatientDetails(),
    );
  }
}

class RegisteredPatientDetails extends StatefulWidget {
  @override
  _RegisteredPatientDetailsState createState() =>
      _RegisteredPatientDetailsState();
}

class _RegisteredPatientDetailsState extends State<RegisteredPatientDetails> {
  List<PatientFormData> patientData = List<PatientFormData>();

  @override
  void initState() {
    super.initState();
    PatientFormController().getFeedList().then((patientData) {
      setState(() {
        this.patientData = patientData;
        print("PatientsData: ${patientData[0].toJson()} ");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patientData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientAllDetails(),
                        settings:
                            RouteSettings(arguments: patientData[index])));
              },
              title: Row(
                children: [
                  Icon(Icons.person),
                  Expanded(
                    child: Text(
                        "${patientData[index].patientName} ${patientData[index].age}"),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
          ],
        );
      },
    );
  }
}
