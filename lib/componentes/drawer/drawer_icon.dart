import 'package:flutter/material.dart';

class IconDrawer extends StatelessWidget {
  const IconDrawer({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        image: AssetImage('images/perfil.jpg',),
                        fit: BoxFit.fill
                        ),
                    ),
                  ),
    );
  }
}