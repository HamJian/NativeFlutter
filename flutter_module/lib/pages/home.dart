import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/pages/dynamic/dynamic.dart';
import 'package:flutter_module/pages/index/index.dart';
import 'package:flutter_module/pages/message/message.dart';
import 'package:flutter_module/pages/mine/mine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      backgroundColor: Colors.grey,
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: homePages[currentIndex],
    );
  }

  final List<BottomNavigationBarItem> bottomTabs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.dynamic_feed),
      label: '动态',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: '消息',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '我的',
    ),
  ];

  final List homePages = [
    const IndexPage(),
    const DynamicPage(),
    const MessagePage(),
    const MinePage(),
  ];
}
