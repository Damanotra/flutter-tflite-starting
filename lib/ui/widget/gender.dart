import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget genderWidget(icon, text, size, selected, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: size.height * 0.12,
          color: selected == text ? Colors.indigo : Colors.black54,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          text,
          style: TextStyle(
            color: selected == text ? Colors.white : Colors.black,
          ),
        )
      ],
    ),
  );
}