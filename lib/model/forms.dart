class FeedForm {
  String firstName;
  String lastName;
  String mobileNo;

  FeedForm(this.firstName, this.lastName, this.mobileNo);

  factory FeedForm.fromJson(dynamic json) {
    //parameters must be same as json String value from URL get
    return FeedForm(
        "${json['fname']}", "${json['lname']}", "${json['mob_no']}");
  }

  //method to get parameters
  Map toJson() =>
      {'firstName': firstName, 'lastName': lastName, 'mobileNo': mobileNo};
}
