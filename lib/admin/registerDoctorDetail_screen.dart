import 'package:doctor_appointment/admin/regDoctorAllDetails.dart';
import 'package:doctor_appointment/controller/doctor_form_controller.dart';
import 'package:doctor_appointment/model/doctor_form_data.dart';
import 'package:flutter/material.dart';

class AllRegisterDoctorScreen extends StatelessWidget {
  static const id = "AdminRegisterDoctorScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Doctor Details'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: RegisteredDoctorDetails(),
    );
  }
}

class RegisteredDoctorDetails extends StatefulWidget {
  @override
  _RegisteredDoctorDetailsState createState() =>
      _RegisteredDoctorDetailsState();
}

class _RegisteredDoctorDetailsState extends State<RegisteredDoctorDetails> {
  List<DoctorFormData> doctorData = List<DoctorFormData>();

  @override
  void initState() {
    super.initState();
    DoctorFormController().getFeedList().then((doctorData) {
      setState(() {
        this.doctorData = doctorData;
        print("DoctorsData: ${doctorData[0].toJson()} ");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctorData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorAllDetails(),
                        settings: RouteSettings(arguments: doctorData[index])));
              },
              title: Row(
                children: [
                  Icon(Icons.person),
                  Expanded(
                    child: Text(doctorData[index].doctorName),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
            )
          ],
        );
      },
    );
  }
}
