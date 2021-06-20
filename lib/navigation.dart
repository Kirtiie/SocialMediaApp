import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia/Friends/request.dart';
import 'package:socialmedia/Tabs/home.dart';
import 'package:socialmedia/profiles/profile.dart';

var color = Colors.white;

class Navigation extends StatefulWidget {
  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      // physics: new NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          bottomSelectedIndex = index;
        });
        pageChanged(index);
      },
      children: <Widget>[home(), home(), request(), profile()],
    );
  }

  Color theme_main;
  Color theme_text;
  Color theme_icon;
  Color theme_navigation;
  ScrollController _arrowsController = ScrollController();

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

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<ProviderData>(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.indigo[900],
      // ),
      body: buildPageView(),
      bottomNavigationBar: CurvedNavigationBar(
        color: theme_navigation,
        backgroundColor: theme_main,
        buttonBackgroundColor: theme_navigation,
        index: bottomSelectedIndex,
        items: [
          Icon(
            Icons.home,
            color: theme_icon,
          ),
          Icon(
            Icons.shop_two,
            color: theme_icon,
          ),
          Icon(
            Icons.person_add,
            color: theme_icon,
          ),
          Icon(
            Icons.account_circle,
            color: theme_icon,
          )
        ],
        onTap: (index) {
          bottomTapped(index);
        },
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
}