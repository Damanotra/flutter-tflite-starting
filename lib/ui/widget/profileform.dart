import 'dart:io';
import 'gender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController _nameController = TextEditingController();

  String gender, interestedIn;
  DateTime age;
  File photo;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.white,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width,
              child: CircleAvatar(
                radius: size.width * 0.3,
                backgroundColor: Colors.transparent,
                child: photo == null
                    ? GestureDetector(
                  onTap: () async {
                    File getPic =
                    await FilePicker.getFile(type: FileType.image);
                    if (getPic != null) {
                      setState(() {
                        photo = getPic;
                      });
                    }
                  },
                  child: Image.asset('assets/img/profilephoto.png'),
                )
                    : GestureDetector(
                  onTap: () async {
                    File getPic =
                    await FilePicker.getFile(type: FileType.image);
                    if (getPic != null) {
                      setState(() {
                        photo = getPic;
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: size.width * 0.3,
                    backgroundImage: FileImage(photo),
                  ),
                ),
              ),
            ),
            textFieldWidget(_nameController, "Name", size),
            GestureDetector(
              onTap: () {
                DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime(DateTime.now().year - 19, 1, 1),
                    onConfirm: (date) {
                      print('picked $date');
                    }
                );
              },
              child: Text(
                "Enter Birthday",
                style: TextStyle(
                    color: Colors.indigo, fontSize: size.width * 0.07),
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.03),
                  child: Text(
                    "You Are",
                    style: TextStyle(
                        color: Colors.indigo, fontSize: size.width * 0.07),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    genderWidget(
                        FontAwesomeIcons.venus, "Female", size, gender,
                            () {
                          setState(() {
                            gender = "Female";
                          });
                        }),
                    genderWidget(
                        FontAwesomeIcons.mars, "Male", size, gender, () {
                      setState(() {
                        gender = "Male";
                      });
                    })
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.03),
                  child: Text(
                    "Looking For",
                    style: TextStyle(
                        color: Colors.indigo, fontSize: size.width * 0.07),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    genderWidget(
                        FontAwesomeIcons.venus, "Female", size, gender,
                            () {
                          setState(() {
                            gender = "Female";
                          });
                        }),
                    genderWidget(
                        FontAwesomeIcons.mars, "Male", size, gender, () {
                      setState(() {
                        gender = "Male";
                      });
                    })
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.03),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius:
                    BorderRadius.circular(size.height * 0.05),
                  ),
                  child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            color: Colors.white),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textFieldWidget(TextEditingController controller, String text, Size size) {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.03),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          labelStyle:
          TextStyle(color: Colors.indigo, fontSize: size.height * 0.03),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo, width: 1.0),
          ),
        ),
      ),
    );
  }
}
