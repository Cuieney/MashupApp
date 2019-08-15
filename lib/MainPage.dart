import 'package:flutter/material.dart';
import 'package:news_app/DiscoverPage.dart';
import 'package:news_app/HomePage.dart';
import 'package:news_app/MePage.dart';

void main() {
  runApp (MainContainer());
}

class MainContainer extends StatelessWidget {
  const MainContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(

        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(), DiscoverPage(), MePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页',style: _currentIndex==0?TextStyle(color: Color(0xFF02AF8A),fontSize: 11):TextStyle(color: Color(0xFF4E4E4E),fontSize: 11),),
            activeIcon: Icon(Icons.home,color: Color(0xFF02AF8A))
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('发现',style: _currentIndex==1?TextStyle(color: Color(0xFF02AF8A),fontSize: 11):TextStyle(color: Color(0xFF4E4E4E),fontSize: 11),),
            activeIcon: Icon(Icons.mail,color: Color(0xFF02AF8A))
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              title: Text('我的',style: _currentIndex==2?TextStyle(color: Color(0xFF02AF8A),fontSize: 11):TextStyle(color: Color(0xFF4E4E4E),fontSize: 11),),
              activeIcon: Icon(Icons.person,color: Color(0xFF02AF8A))
              )
        ],
      ),
    );
  }

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
