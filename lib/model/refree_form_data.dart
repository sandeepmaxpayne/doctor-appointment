class RefreeForm {
  String refererName;
  String patientName;
  String age;
  String gender;
  String diagnosis;
  String motivated;
  String referrerPhoneNo;
  String patientPhoneNo;
  String place;
  String referredPersonMail;

  RefreeForm(
    this.refererName,
    this.patientName,
    this.age,
    this.gender,
    this.diagnosis,
    this.motivated,
    this.referrerPhoneNo,
    this.patientPhoneNo,
    this.place,
    this.referredPersonMail,
  );

  factory RefreeForm.fromJson(dynamic json) {
    //parameters must be same as json String value from URL get
    return RefreeForm(
        "${json['refererName']}",
        "${json['patientName']}",
        "${json['age']}",
        "${json['gender']}",
        "${json['diagnosis']}",
        "${json['motivated']}",
        "${json['referrerPhoneNo']}",
        "${json['patientPhoneNo']}",
        "${json['place']}",
        "${json['referredPersonMail']}");
  }

  //method to get parameters
  Map toJson() => {
        'refererName': refererName,
        'patientName': patientName,
        'age': age,
        'gender': gender,
        'diagnosis': diagnosis,
        'motivated': motivated,
        'referrerPhoneNo': referrerPhoneNo,
        'patientPhoneNo': patientPhoneNo,
        'place': place,
        'referredPersonMail': referredPersonMail,
      };
}
