class HospitalFormData {
  String hospitalName;
  String ownerName;
  String contactPerson;
  String mobileNo;
  String email;
  String regNo;
  String otSurgery;
  String bed;
  String specialities;
  String otgCharge;

  HospitalFormData(
      this.hospitalName,
      this.ownerName,
      this.contactPerson,
      this.mobileNo,
      this.email,
      this.regNo,
      this.otSurgery,
      this.bed,
      this.specialities,
      this.otgCharge);

  factory HospitalFormData.fromJson(dynamic json) {
    //parameters must be same as json String value from URL get
    return HospitalFormData(
        "${json['hName']}",
        "${json['oName']}",
        "${json['cPerson']}",
        "${json['mob_no']}",
        "${json['email']}",
        "${json['regNo']}",
        "${json['otSurg']}",
        "${json['bed']}",
        "${json['spec']}",
        "${json['otgCharge']}");
  }

  //method to get parameters
  Map toJson() => {
        'hospitalName': hospitalName,
        'ownerName': ownerName,
        'contactPerson': contactPerson,
        'mobileNo': mobileNo,
        'email': email,
        'regNo': regNo,
        'otSurgery': otSurgery,
        'bed': bed,
        'specialities': specialities,
        'otgCharge': otgCharge
      };
}
