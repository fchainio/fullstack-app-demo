import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/explorer.dart';
import './pages/my.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '萤火钱包',
      showPerformanceOverlay: true,
      home: MainPage()
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() {
    return _MainPageState();
  }

}

class _MainPageState extends State<MainPage>{

  List<Widget> pages = [
    HomePage(),
    ExplorerPage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(children: pages,),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.explore)),
              Tab(icon: Icon(Icons.person))
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
  
}

