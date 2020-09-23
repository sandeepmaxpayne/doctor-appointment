import 'package:flutter/foundation.dart';

class ChatData extends ChangeNotifier {
  String phNo = "123456";

  void changeData(String newData) {
    phNo = newData;
    notifyListeners();
  }
}
