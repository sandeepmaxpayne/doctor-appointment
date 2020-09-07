class FeedForm {
  String firstName;
  String lastName;
  String mobileNo;

  FeedForm(this.firstName, this.lastName, this.mobileNo);

  factory FeedForm.fromJson(dynamic json) {
    return FeedForm(
        "${json['firstName']}", "${json['lastName']}", "${json['mobileNo']}");
  }

  //method to get parameters
  Map toJson() =>
      {'firstName': firstName, 'lastName': lastName, 'mobileNo': mobileNo};
}
