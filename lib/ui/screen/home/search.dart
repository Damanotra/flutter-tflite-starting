import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTab extends StatefulWidget{
  @override
  _SearchTabState createState() => _SearchTabState();

}

class _SearchTabState extends State<SearchTab>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.indigo),
      ),
    );
  }

  Widget userGender(gender) {
    switch (gender) {
      case 'Male':
        return Icon(
          FontAwesomeIcons.mars,
          color: Colors.white,
        );
        break;
      case 'Female':
        return Icon(
          FontAwesomeIcons.venus,
          color: Colors.white,
        );
        break;
      default:
        return null;
        break;
    }
  }
}