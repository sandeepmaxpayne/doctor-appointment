class RefreeForm {
  String refererName;
  String age;
  String gender;
  String diagnosis;
  String motivated;
  String referrerPhoneNo;
  String patientPhoneNo;
  String place;

  RefreeForm(
    this.refererName,
    this.age,
    this.gender,
    this.diagnosis,
    this.motivated,
    this.referrerPhoneNo,
    this.patientPhoneNo,
    this.place,
  );

  factory RefreeForm.fromJson(dynamic json) {
    //parameters must be same as json String value from URL get
    return RefreeForm(
        "${json['refererName']}",
        "${json['age']}",
        "${json['gender']}",
        "${json['diagnosis']}",
        "${json['motivated']}",
        "${json['referrerPhoneNo']}",
        "${json['patientPhoneNo']}",
        "${json['place']}");
  }

  //method to get parameters
  Map toJson() => {
        'refererName': refererName,
        'age': age,
        'gender': gender,
        'diagnosis': diagnosis,
        'motivated': motivated,
        'referrerPhoneNo': referrerPhoneNo,
        'patientPhoneNo': patientPhoneNo,
        'place': place,
      };
}
