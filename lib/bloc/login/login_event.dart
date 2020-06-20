import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
class LoginEvent {
  final BuildContext context;
  final String email;
  final String password;
  LoginEvent({this.context, this.email, this.password});
}

class InitialLoginEvent extends LoginEvent{
  InitialLoginEvent(BuildContext context) : super(context:context);
}

class Submitted extends LoginEvent {
  Submitted(String email, String password) : super(email:email, password:password);
}