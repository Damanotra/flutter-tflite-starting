import '../../widget/profileform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilesetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Setup", style: TextStyle(color: Colors.indigo,fontSize: 28)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ProfileForm(),
      backgroundColor: Colors.white,
    );
  }
}
