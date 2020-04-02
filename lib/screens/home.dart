import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/screens/trending.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Trending(),
        ],
        onPageChanged: (int index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
      bottomNavigationBar: bottomItems(),
    );
  }

  BottomNavigationBar bottomItems() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.pink[300],
      unselectedItemColor: Colors.white,
      elevation: 0.5,
      onTap: (int index) {
        setState(
          () {
            currentIndex = index;
          },
        );
        // pageController.animateToPage(
        //   index,
        //   duration: Duration(
        //     milliseconds: 200,
        //   ),
        //   curve: Curves.easeIn,
        // );
      },
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: tikTokLog(),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.indeterminate_check_box),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userAlt),
          title: SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget tikTokLog() {
    return Container(
      width: 45.0,
      height: 27.0,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0),
            width: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.pink[300],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.blue[200],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            width: 30.0,
            height: double.infinity,
            child: Icon(Icons.add, color: Colors.black),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
