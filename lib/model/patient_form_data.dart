class PatientFormData {
  String patientName;
  String age;
  String gender;
  String lang;
  String place;
  String email;
  String phoneNo;
  String complaint;
  String investigation;
  String diagnosis;
  String surgeryAdvise;
  String startBudget;
  String endBudget;

  PatientFormData(
    this.patientName,
    this.age,
    this.gender,
    this.lang,
    this.place,
    this.email,
    this.phoneNo,
    this.complaint,
    this.investigation,
    this.diagnosis,
    this.surgeryAdvise,
    this.startBudget,
    this.endBudget,
  );

  factory PatientFormData.fromJson(dynamic json) {
    //parameters must be same as json String value from URL get
    return PatientFormData(
        "${json['patientName']}",
        "${json['age']}",
        "${json['gender']}",
        "${json['lang']}",
        "${json['place']}",
        "${json['email']}",
        "${json['phNo']}",
        "${json['complaint']}",
        "${json['investigation']}",
        "${json['diag']}",
        "${json['surgAdvise']}",
        "${json['startBudget']}",
        "${json['endBudget']}");
  }

  //method to get parameters
  Map toJson() => {
        'patientName': patientName,
        'age': age,
        'gender': gender,
        'lang': lang,
        'place': place,
        'email': email,
        'phoneNo': phoneNo,
        'complaint': complaint,
        'investigation': investigation,
        'diagnosis': diagnosis,
        'surgeryAdvise': surgeryAdvise,
        'startBudget': startBudget,
        'endBudget': endBudget,
      };
}
