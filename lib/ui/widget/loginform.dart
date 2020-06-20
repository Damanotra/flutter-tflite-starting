import '../../bloc/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginBloc = LoginBloc();

  @override
  void initState(){
    super.initState();
  }

  void onFormSubmitted(){
    if(_emailController.toString() != "" && _passwordController.toString() != ""){
      _loginBloc.add(Submitted(_emailController.text.toString(),_passwordController.text.toString()));
    }
  }

  void dispose(){
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;

    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context,LoginState state){
        if(state.isFailure){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Wrong email or password"),
                  Icon(Icons.error)
                ],
              ),
              duration: Duration(seconds: 4),
            )
            );
        }

        if(state.isSubmitting){
          print("isSubmitting");
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(" Logging In..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if(state.isSuccess){
          print("Success");
          Navigator.of(context).pushNamed('/home');
        }
      },
      child: SingleChildScrollView(
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
                      onTap: onFormSubmitted,
                      child: Container(
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius:
                          BorderRadius.circular(size.height * 0.005),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: size.height * 0.025,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.02),
                    GestureDetector(
                      onTap: (){
                        print("move to register");
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text(
                        "Are you new? Let's create an account",
                        style: TextStyle(
                            fontSize: size.height*0.025,
                            color: Colors.indigo,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}