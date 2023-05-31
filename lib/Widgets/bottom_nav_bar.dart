import 'package:costm/Competicao/competicao.dart';
import 'package:costm/Home/home.dart';
import 'package:costm/Jogador/jogador.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarapp extends StatelessWidget {
  int indexNum = 0;

  BottomNavigationBarapp({required this.indexNum});

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Competição'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Jogador'
        ),
      ],
      currentIndex: indexNum,
      onTap: (indexNum) {
        if (indexNum == 0) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
        } else if (indexNum == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CompeticaoPage()));
          }else if (indexNum == 2) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => JogadorPage()));
            }
        }
    );
  }
}