import 'package:flutter/material.dart';

class Anuncios extends StatefulWidget {
  const Anuncios
({ Key key }) : super(key: key);

  @override
  State<Anuncios> createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('Anuncios'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Container(),
            )
          ],
        ),
      ),
      
    );
  }
}