
import 'package:costm/Widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JogadorPage extends StatelessWidget {
  const JogadorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Jogador'),
      centerTitle: true,
    ),
      bottomNavigationBar: BottomNavigationBarapp(indexNum: 2)
  );
}