import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia/chats/Componenets/header.dart';
import 'package:socialmedia/chats/Componenets/tab_base.dart';

class chatpages extends StatefulWidget {
  @override
  _chatpagesState createState() => _chatpagesState();
}

class _chatpagesState extends State<chatpages> {
  Color theme_main;
  Color theme_text;
  Color theme_icon;
  Color theme_navigation;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  // bool a = false;
  bool a = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer timer = Timer.periodic(Duration(milliseconds: 900), (Timer t) {
    //   setState(() {});
    // });

    App_theme();
  }

  App_theme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('name', nameCont.text);
    // prefs.setString('username', usernameCont.text);
    setState(() {
      a = prefs.getBool('theme');
    });
    if (a) {
      print("object");
      setState(() {
        theme_main = Colors.black;
        theme_text = Colors.white;
        theme_icon = Colors.white;
        theme_navigation = Colors.grey[900];
      });
    } else {
      setState(() {
        theme_main = Colors.white;
        theme_text = Colors.black;
        theme_icon = Colors.black;
        theme_navigation = Colors.grey[200];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    onWillPop() {
      Navigator.of(context).pop();
    }

    return WillPopScope(
        child: Container(
          padding: EdgeInsets.only(top: 0),
          child: SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: theme_main,
                  flexibleSpace: Header(''),
                  bottom: TabBar(
                      tabs: <Widget>[
                        Container(
                          height: 50.0,
                          child: Tab(
                            text: 'My Friends',
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: Tab(
                            text: 'Groups',
                          ),
                        ),
                      ],
                      labelColor: theme_text,
                      unselectedLabelColor: theme_text,
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      indicatorWeight: 4.0,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.blue),
                ),
                body: TabBarView(
                  children: <Widget>[
                    tabbase(
                      tabName: 'Friends',
                    ),
                    tabbase(
                      tabName: 'groups',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: onWillPop);
  }
}
