import '../locator.dart';
import '../resources/provider/api/auth_api.dart';
import 'package:flutter/foundation.dart';

class LoginService extends ChangeNotifier{
  AuthAPI _api = locator<AuthAPI>();
  bool authenticated;

  Future<bool> isAuthenticated(String email, String password) async{
    var result = await _api.getMatchedData(email, password);
    //print(result.documents[0].data['name']);
    authenticated = result.documents.toList().length > 0 ? true : false;
    return authenticated;
  }

}