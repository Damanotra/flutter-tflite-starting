import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
class SearchEvent {
  final BuildContext context;
  final String gender;
  final index;
  SearchEvent({this.context, this.gender, this.index});
}

class LoadUserEvent extends SearchEvent {
  LoadUserEvent(BuildContext context, String gender) : super(context: context, gender : gender);
}

class SelectUserEvent extends SearchEvent {
  SelectUserEvent(BuildContext context, int index) : super(context:context, index:index);
}