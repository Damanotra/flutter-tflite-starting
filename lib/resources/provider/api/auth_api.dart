import 'package:cloud_firestore/cloud_firestore.dart';

class AuthAPI{
  AuthAPI();
  Future<QuerySnapshot> getMatchedData(String email, String password){
    print("email=$email");
    print("password=$password");
    final rest = Firestore.instance.collection("users").where("email",isEqualTo: "test@test.com").getDocuments();
    return rest;
  }
}