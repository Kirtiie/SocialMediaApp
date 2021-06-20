import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class friends extends StatefulWidget {
  // const friends({ Key? key }) : super(key: key);

  @override
  _friendsState createState() => _friendsState();
}

class _friendsState extends State<friends> {
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
    return Scaffold(
      backgroundColor: theme_main,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data.docs.map<Widget>((document) {
                return FriendList(
                  document['photo'],
                  document['username'],
                  document['name'],
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  Widget FriendList(String userimg, String username, String name) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(userimg),
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    username,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: theme_text,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  width: 150,
                  child: Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
