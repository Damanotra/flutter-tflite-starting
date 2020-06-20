import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tflite_demo/resources/provider/api/user_api.dart';

import '../locator.dart';
import '../resources/provider/api/auth_api.dart';
import 'package:flutter/foundation.dart';

class UserService extends ChangeNotifier{
  UserAPI _api = locator<UserAPI>();
  bool authenticated;


  Future<List> getByGender(String gender) async {
    var result = await _api.getByGender(gender);
    return result.documents.toList();
  }

}