import 'package:doctor_appointment/model/patient_form_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PatientFormController {
  // Google App Script Web URL
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxBlhZY4b3QFqdTgWuV7GAQqc7_TUxCycLiSDp2nkZM8ADXu0Q/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  ///async function which saves the form data , parses [FeedForm] parameters
  ///and sends HTTP GET request on [URL]. on success [callback] is called.

  void submitForm(
      PatientFormData feedForm, void Function(String) callback) async {
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

  //Method to get the users data
  Future<List<PatientFormData>> getFeedList() async {
    return await http.get(URL).then((response) {
      var jsonFeedResult = convert.jsonDecode(response.body) as List;
      print(
          "response: ${jsonFeedResult.map((v) => PatientFormData.fromJson(v).toJson())}");

      return jsonFeedResult
          .map((json) => PatientFormData.fromJson(json))
          .toList();
    });
  }
}
