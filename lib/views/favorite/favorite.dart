import 'package:flutter/material.dart';
class Favorite extends StatelessWidget {
  const Favorite({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('Favorites'),
      ),
      
    );
  }
}