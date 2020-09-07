import 'package:doctor_appointment/model/forms.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  // Google App Script Web URL
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxIZqY-kNpK9bk40NHz-RmrRASZV3nyKXNh8GmtcnKo-ye4f-o/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  ///async function which saves the form data , parses [FeedForm] parameters
  ///and sends HTTP GET request on [URL]. on success [callback] is called.
  void submitForm(FeedForm feedForm, void Function(String) callback) async {
    try {
      await http.post(URL, body: feedForm.toJson()).then((response) async {
        print("response code:${response.statusCode}");
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (ex) {
      print("exception occurred in webapp: $ex");
    }
  }
}
