import 'package:doctor_appointment/admin/regHospitalAllDetail.dart';
import 'package:doctor_appointment/controller/hospital_form_controller.dart';
import 'package:doctor_appointment/model/hospital_form_data.dart';
import 'package:flutter/material.dart';

class AllHospitalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Hospital'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: HospitalDetailPage(),
    );
  }
}

class HospitalDetailPage extends StatefulWidget {
  @override
  _HospitalDetailPageState createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  List<HospitalFormData> hospitalItems = List<HospitalFormData>();

  @override
  void initState() {
    super.initState();
    HospitalFormController().getFeedList().then((hospitalItems) {
      setState(() {
        this.hospitalItems = hospitalItems;
        print("hospitalData: ${hospitalItems[0].toJson()})}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hospitalItems.length - 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HospitalAllDetails(),
                        settings:
                            RouteSettings(arguments: hospitalItems[index])));
              },
              title: Row(
                children: [
                  Icon(Icons.local_hospital),
                  Expanded(
                    child: Text(hospitalItems[index].hospitalName),
                  ),
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
