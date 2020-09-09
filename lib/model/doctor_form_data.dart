class DoctorFormData {
  String doctorName;
  String age;
  String gender;
  String language;
  String place;
  String email;
  String phoneNo;
  String specialization;
  String degree;
  String regNo;
  String skill;
  String freelance;

  DoctorFormData(
      this.doctorName,
      this.age,
      this.gender,
      this.language,
      this.place,
      this.email,
      this.phoneNo,
      this.specialization,
      this.degree,
      this.regNo,
      this.skill,
      this.freelance);

  factory DoctorFormData.fromJson(dynamic json) {
    //parameters must be same as json String value from URL get
    return DoctorFormData(
        "${json['docName']}",
        "${json['age']}",
        "${json['gender']}",
        "${json['lang']}",
        "${json['place']}",
        "${json['email']}",
        "${json['phNo']}",
        "${json['spec']}",
        "${json['degree']}",
        "${json['regNo']}",
        "${json['skill']}",
        "${json['freelance']}");
  }

  //method to get parameters
  Map toJson() => {
        'doctorName': doctorName,
        'age': age,
        'gender': gender,
        'language': language,
        'place': place,
        'email': email,
        'phoneNo': phoneNo,
        'specialization': specialization,
        'degree': degree,
        'regNo': regNo,
        'skill': skill,
        'freelance': freelance
      };
}
