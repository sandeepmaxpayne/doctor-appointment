import 'package:doctor_appointment/admin/refreeAllDetails.dart';
import 'package:doctor_appointment/controller/refree_form_controller.dart';
import 'package:doctor_appointment/model/refree_form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RefreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Referer Person'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: RefreeScreenDetails(),
    );
  }
}

class RefreeScreenDetails extends StatefulWidget {
  @override
  _RefreeScreenDetailsState createState() => _RefreeScreenDetailsState();
}

class _RefreeScreenDetailsState extends State<RefreeScreenDetails> {
  List<RefreeForm> refreeData = List<RefreeForm>();

  @override
  void initState() {
    super.initState();
    RefreeController().getFeedList().then((patientData) {
      setState(() {
        this.refreeData = patientData;
        print("PatientsData: ${patientData[0].toJson()} ");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: refreeData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RefreeAllDetails(),
                        settings: RouteSettings(arguments: refreeData[index])));
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(refreeData[index].refererName),
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
