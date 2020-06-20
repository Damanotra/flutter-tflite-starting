import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  goToProfilesetup (){
    print("move to profile setup");
    Navigator.of(context).pushNamed('/profilesetup');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "GAWAIN",
                style: TextStyle(fontSize: size.width*0.15,color: Colors.indigo),
              ),
            ),
            Container(
              width: size.width*0.8,
              child: Divider(height: size.height*0.05,color: Colors.indigo),
            ),
            Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Colors.indigo, fontSize: size.height * 0.03),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: TextFormField(
                controller: _passwordController,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Colors.indigo, fontSize: size.height * 0.03),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.indigo, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.indigo, width: 1.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: goToProfilesetup,
                    child: Container(
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius:
                        BorderRadius.circular(size.height * 0.005),
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}