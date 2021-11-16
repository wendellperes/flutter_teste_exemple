
import 'package:avaliacao_empresa_flutter/views/anuncios/anuncios.dart';
import 'package:avaliacao_empresa_flutter/views/favorite/favorite.dart';
import 'package:avaliacao_empresa_flutter/views/home_view/home.dart';
import 'package:flutter/material.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({ Key key }) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  int currentIndex = 0;
  List<Widget> screens = [
    Home(),
    Favorite(),
    Anuncios()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedFontSize: 17,
        onTap: (index) => setState(()=> currentIndex = index),
        selectedItemColor: Colors.pink[300],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_sharp),
            label: 'Favoritos',
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label: 'Meus Anúncios',
            backgroundColor: Colors.white
          ),
          
        ],
      ),
    );
  }
}