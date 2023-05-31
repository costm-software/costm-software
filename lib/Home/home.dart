
import 'package:costm/Widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
  class _HomePageState extends State<HomePage>{
    @override
    Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBarapp(indexNum: 0)
    );
}