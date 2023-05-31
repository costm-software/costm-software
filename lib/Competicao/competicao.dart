
import 'package:costm/Widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompeticaoPage extends StatefulWidget {
  const CompeticaoPage({super.key});

  @override
  _CompeticaoPage createState() => _CompeticaoPage();
}
class _CompeticaoPage extends State<CompeticaoPage>{
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Competição'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBarapp(indexNum: 1)
  );
}