import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tflite_demo/ui/widget/iconWidget.dart';
import '../../../bloc/search/search.dart';
import '../../widget/profile.dart';

class SearchTab extends StatefulWidget{
  @override
  _SearchTabState createState() => _SearchTabState();

}

class _SearchTabState extends State<SearchTab>{
  final _searchBloc = SearchBloc();
  List _allUser;
  int _index = 0;
  //User _user, _currentUser;
  //int difference;

  @override
  void initState(){
    super.initState();
  }

  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder(
      bloc: _searchBloc,
      builder: (BuildContext context, SearchState state){
        if(state.initialized){
          _searchBloc.add(LoadUserEvent(context,"Female"));
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
            ),
          );
        }
        if(state.isLoading){
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
            ),
          );
        }
        if(state.allUser.isNotEmpty || state.index!=_index){
          if(state.allUser.isNotEmpty){
            _allUser = state.allUser;
            _index = 0;
          }
          else{
            _index = state.index;
          }
          return profileWidget(
            padding: size.height * 0.035,
            photoHeight: size.height * 0.824,
            photoWidth: size.width * 0.95,
            photo:_allUser[_index].data['photo'],
            clipRadius: size.height * 0.02,
            containerHeight: size.height * 0.3,
            containerWidth: size.width * 0.9,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: size.height*0.06),
                  Row(children: <Widget>[
                    userGender(_allUser[_index].data['gender']),
                    Expanded(
                        child: Text(
                          " " + _allUser[_index].data['name']+", "
                          + (DateTime.now().year - _allUser[_index].data['birth'].toDate().year)
                          .toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height*0.035),
                        )
                    )
                  ]),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      iconWidget(EvaIcons.flash, () {}, size.height * 0.04,
                          Colors.yellow),
                      iconWidget(Icons.clear, () {
                        if(_allUser.isNotEmpty && _allUser.length>_index+1){
                          _searchBloc.add(
                              SelectUserEvent(context,_index+1));
                        } else {
                          _searchBloc.add(LoadUserEvent(context,"Female"));
                        }
                      }, size.height * 0.08, Colors.blue),
                      iconWidget(FontAwesomeIcons.solidHeart, () {
                        if(_allUser.isNotEmpty && _allUser.length>_index+1){
                          _searchBloc.add(
                              SelectUserEvent(context,_index+1));
                        } else {
                          _searchBloc.add(LoadUserEvent(context,"Female"));
                        }
                      }, size.height * 0.06, Colors.red),
                      iconWidget(EvaIcons.options2, () {}, size.height * 0.04,
                          Colors.white)
                    ]),
                  SizedBox(height: size.height*0.03,)
                ],),
            )
          );
        }
        return Container();

      }
    );
    // TODO: implement build
//    return Center(
//      child: CircularProgressIndicator(
//        valueColor: AlwaysStoppedAnimation(Colors.indigo),
//      ),
//    );
  }

  Widget userGender(gender) {
    print(gender);
    switch (gender) {
      case "Male":
        return Icon(
          FontAwesomeIcons.mars,
          color: Colors.white,
        );
        break;
      case "Female":
        return Icon(
          FontAwesomeIcons.venus,
          color: Colors.white,
        );
        break;
      default:
    }
  }
}