import 'package:cloud_firestore/cloud_firestore.dart';

class UserAPI{
  UserAPI();
  Future<QuerySnapshot> getMatchedData(String email, String password){
    final rest = Firestore.instance.collection("users").where("email",isEqualTo: "test@test.com").getDocuments();
    return rest;
  }

  Future<QuerySnapshot> getByGender(String gender){
    final rest = Firestore.instance.collection("users")
        .where("gender",isEqualTo: gender).getDocuments();
    return rest;
  }
}