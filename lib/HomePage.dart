import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TopTabBar(),
      ),
    );
  }
}

class TopTabBar extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '推荐'),
    new Tab(text: '本地'),
    new Tab(text: '娱乐'),
    new Tab(text: '体育'),
    new Tab(text: '科技'),
    new Tab(text: '政治'),
    new Tab(text: '经济'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: TabBar(
              indicatorColor: Colors.white,
              labelColor: Color(0xFF02AF8A),
              unselectedLabelColor: Color(0xFF666666),
              tabs: myTabs.map((Tab tab) {
                return Text(tab.text);
              }).toList(),
              isScrollable: true),
        ),
        body: TabBarView(
            children: myTabs.map((Tab tab) {
          return Center(child:Text(tab.text));
        }).toList()),
      ),
    );
  }
}
