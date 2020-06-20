import '../screen/home/matches.dart';
import '../screen/home/messages.dart';
import '../screen/home/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> tabs = [
      SearchTab(),
      MatchesTab(),
      MessagesTab(),
    ];

    return
      Theme(
        data: ThemeData(
            primaryColor: Colors.indigo,
            accentColor: Colors.white
        ),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "GAWAIN",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(48.0),
                child: Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TabBar(
                        tabs: <Widget>[
                          Tab(icon: Icon(Icons.search)),
                          Tab(icon: Icon(Icons.people)),
                          Tab(icon: Icon(Icons.message)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: tabs,
            ),
          ),
        ),
      );
  }

}