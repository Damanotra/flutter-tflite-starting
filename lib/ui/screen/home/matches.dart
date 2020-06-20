import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchesTab extends StatefulWidget{
  @override
  _MatchesTabState createState() => _MatchesTabState();

}

class _MatchesTabState extends State<MatchesTab>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.indigo),
      ),
    );
  }
}