import 'package:doctor_appointment/controller/form_controller.dart';
import 'package:doctor_appointment/model/forms.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FeedbackListPage(),
    );
  }
}

class FeedbackListPage extends StatefulWidget {
  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  List<FeedForm> feedbackItems = List<FeedForm>();

  @override
  void initState() {
    super.initState();
    FormController().getFeedList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
        print("feedbackItems: ${feedbackItems[0].toJson()}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: ListView.builder(
        itemCount: feedbackItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Icon(Icons.person),
                Expanded(
                  child: Text(
                      "${feedbackItems[index].firstName} ${feedbackItems[index].lastName}"),
                )
              ],
            ),
            subtitle: Row(
              children: [Text(feedbackItems[index].mobileNo)],
            ),
          );
        },
      ),
    );
  }
}
