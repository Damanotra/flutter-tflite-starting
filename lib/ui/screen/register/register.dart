
import '../../../ui/widget/registerform.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.indigo,
              onPressed: (){
                Navigator.of(context).pop();
              }),
          title: Text(
              "REGISTER",
              style: TextStyle(fontSize: 36.0,color: Colors.indigo)
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: RegisterForm()
    );
  }
}
