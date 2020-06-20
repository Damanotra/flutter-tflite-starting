import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesTab extends StatefulWidget{
  @override
  _MessagesTabState createState() => _MessagesTabState();

}

class _MessagesTabState extends State<MessagesTab>{
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