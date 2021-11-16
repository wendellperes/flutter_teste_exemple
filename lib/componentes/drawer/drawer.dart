import 'package:flutter/material.dart';

import 'drawerbody/drawerbody.dart';
import 'drawerhead/drawerhead.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomHeader(),
          CustomBodyDrawer()
        ],
      ),
    );
  }
}