class GroupChatModel {
  String whatsAppLink;

  GroupChatModel(this.whatsAppLink);

  factory GroupChatModel.fromJson(dynamic json) {
    //parameters must be same as json String value from URL get
    return GroupChatModel("${json['whatsAppLink']}");
  }

  //method to get parameters
  Map toJson() => {'whatsAppLink': whatsAppLink};
}
