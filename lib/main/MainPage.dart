import 'package:flutter/material.dart';
import 'package:linker/discover/DiscoverPage2.dart';
import 'package:linker/home/HomePage2.dart';
import 'package:linker/account/MePage2.dart';

// void main() {

//   runApp(MainContainer());
// }

// class MainContainer extends StatelessWidget {
//   const MainContainer({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: MaterialApp(
//         home: MainPage(),
//       ),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [NewHomePage(), DiscoverList(), MePage2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ), // new
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Color(0xFFFFFFFF),
        onTap: _onTabTapped,
        // new
        currentIndex: _currentIndex,
        // new
        iconSize: 20,
        items: [
          new BottomNavigationBarItem(
              icon: Image.asset(
                'images/home.png',
                width: 20,
                height: 20,
              ),
              title: Text(
                '',
                style: _currentIndex == 0
                    ? TextStyle(color: Color(0xFF4A90E2), fontSize: 0)
                    : TextStyle(color: Color(0xFF4E4E4E), fontSize: 0),
              ),
              activeIcon: Image.asset(
                'images/home_press.png',
                width: 20,
                height: 20,
              )),
          new BottomNavigationBarItem(
              icon: Image.asset(
                'images/discover.png',
                width: 20,
                height: 20,
              ),
              title: Text(
                '',
                style: _currentIndex == 1
                    ? TextStyle(color: Color(0xFF4A90E2), fontSize: 0)
                    : TextStyle(color: Color(0xFF4E4E4E), fontSize: 0),
              ),
              activeIcon: Image.asset(
                'images/discover_press.png',
                width: 20,
                height: 20,
              )),
          new BottomNavigationBarItem(
              icon: Image.asset(
                'images/me.png',
                width: 20,
                height: 20,
              ),
              title: Text(
                '',
                style: _currentIndex == 2
                    ? TextStyle(color: Color(0xFF4A90E2), fontSize: 0)
                    : TextStyle(color: Color(0xFF4E4E4E), fontSize: 0),
              ),
              activeIcon: Image.asset(
                'images/me_press.png',
                width: 20,
                height: 20,
              ))
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
