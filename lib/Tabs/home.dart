import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia/Tabs/feed.dart';
import 'package:socialmedia/chats/Componenets/chat_pages.dart';

class home extends StatefulWidget {
  // const home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Color theme_main;
  Color theme_text;
  Color theme_icon;

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
    // getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme_main,
      appBar: AppBar(
        backgroundColor: theme_main,

        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(20),
        //         bottomRight: Radius.circular(20))),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (Context) => Addfeed()));
          },
          child: Icon(
            Icons.add_circle_outline,
            size: 30,
            color: theme_icon,
          ),
        ),
        title: Text(
          'AURA',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: theme_text,
                letterSpacing: 4,
                fontSize: 30,
                fontWeight: FontWeight.w400),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => chatpages()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.chat_bubble,
                size: 25,
                color: theme_icon,
              ),
            ),
          ),
        ],
        centerTitle: true,
        leadingWidth: 70,
      ),
      // body: StreamBuilder(
      //   // stream: .sn,
      //   builder: (context, snapshot) {

      //   },
      // ),
      body: ListView(shrinkWrap: true, children: [
        Container(
          height: 150,
          // width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                your_story(),
                Container(
                  height: 150,
                  // width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        storycircle(),
                        storycircle(),
                        storycircle(),
                        storycircle()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Tile(),
              Tile(),
            ],
          ),
        )
      ]),
    );
  }

  your_story() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 5,
            left: 10,
          ),
          padding: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            border:
                Border.all(color: a ? Colors.white : Colors.black, width: 2),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://thumbs.dreamstime.com/b/default-avatar-profile-trendy-style-social-media-user-icon-187599373.jpg')),
          ),
          height: 112,
          width: 72,
          // child: Container(
          //   margin: EdgeInsets.only(top: 2, left: 75),
          //   height: 30,
          //   width: 30,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               'https://lh3.googleusercontent.com/proxy/01H9MX18DhBmTLXia8saWiVVj3TqxJJ_V6fGBT02RJvPjyBC6DQ1KUKlekhwww5uGe-9gGKMIbwXXxj3IXBb7zlAL3DavYVneUymRg'))),
          // ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100, left: 65),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.freeiconspng.com/uploads/add-icon--icon-search-engine-1.png'))),
        ),
      ],
    );
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
        theme_main = Color(0XFF000000);
        theme_text = Colors.white;
        theme_icon = Colors.white;
      });
    } else {
      // print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
      setState(() {
        theme_main = Colors.white;
        theme_text = Colors.black;
        theme_icon = Colors.black;
      });
    }
  }

  // Tile() {
  //   return;
  // }
}

class Tile extends StatefulWidget {
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool open = true;
  var opa = 0.4;
  Color theme_main;
  Color theme_text;
  Color theme_icon;

  // bool a = false;
  bool a = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    App_theme();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          // setState(() {
          //   open = !open;
          // });
        },
        child: Container(
          // padding: EdgeInsets.only(left: 220, top: 50, bottom: 50),
          margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/6d/62/f0/6d62f0fb9edea6121981088f95ef5e53.jpg'),
                fit: BoxFit.cover,
              ),
              color: theme_main,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          // height: 420,
          height: 420,
          // width: 315,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              open
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        margin: EdgeInsets.only(top: 50, bottom: 50),
                        width: 65,
                        // height: 260,
                        height: 280,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // open = !open;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Icon(
                                  Icons.chat_bubble,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Icon(
                                  Icons.bookmark,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Transform.rotate(
                                    angle: 340 * 3.14 / 180,
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red)
                        ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://media.istockphoto.com/photos/real-macho-picture-id1014791458?k=6&m=1014791458&s=612x612&w=0&h=5lqphJFPseFoWMG2vrWlUTWl3OfuNiS-1Jd27vt1QjA='))),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15, left: 10),
                                height: 50,
                                width: 200,
                                child: Text(
                                  'Jenny Wilson',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.8,
                                      fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            // height: 100,
                            width: 300,
                            child: Text(
                              'Life is like a mirror, we get the best result when we smile.',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.8,
                                  fontSize: 13),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
        theme_main = Color(0XFF000000);
        theme_text = Colors.white;
        theme_icon = Colors.white;
      });
    } else {
      // print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
      setState(() {
        theme_main = Colors.white;
        theme_text = Colors.black;
        theme_icon = Colors.black;
      });
    }
  }
}

class storycircle extends StatefulWidget {
  // const storycircle({ Key? key }) : super(key: key);

  @override
  _storycircleState createState() => _storycircleState();
}

class _storycircleState extends State<storycircle> {
  Timer timer;
  bool invert = false;

  var a = Color(0XFFf43b47);
  var b = Color(0XFF874da2);
  var c = Color(0XFFd09693);

  @override
  void initState() {
    // TODO: implement initState

    // timer = Timer.periodic(Duration(milliseconds: 900), (Timer t) {
    //   if (invert) {
    //     setState(() {
    //       print('called yyyyyyyyyyyyyyyyyy');
    //       invert = false;
    //       a = Color(0XFFd09693);
    //       b = Color(0XFF874da2);
    //       c = Color(0XFFf43b47);
    //     });
    //   } else {
    //     setState(() {
    //       print('called xxxxxxxxxxxxxxxxxxxxx');
    //       invert = true;
    //       a = Color(0XFFf43b47);
    //       b = Color(0XFF874da2);
    //       c = Color(0XFFd09693);
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 0,
        left: 7,
      ),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     border: Border.all(color: Colors.red, width: 1),
      // image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: NetworkImage(
      //         'https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
      //     borderRadius: BorderRadius.all(Radius.circular(20))),
      decoration: BoxDecoration(
        // image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: NetworkImage(
        //         'https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
        gradient: LinearGradient(colors: [
          Color(0XFFf43b47),
          Color(0XFF874da2),
          Color(0XFFd09693),
        ]),

        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://imagevars.gulfnews.com/2021/06/03/Kochi-dark-clouds-rain_179d2715975_medium.jpg')),
        ),
      ),

      height: 112,
      width: 72,
    );
  }
}

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(32),
);

// border for all 3 colors
final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [Colors.yellow.shade600, Colors.orange, Colors.red]),
  border: Border.all(
    color: Colors.amber, //kHintColor, so this should be changed?
  ),
  borderRadius: BorderRadius.circular(32),
);
