import '../../widget/loginform.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "welcome",
              style: TextStyle(fontSize: 36.0,color: Colors.indigo)
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: LoginForm()
    );
  }
}
