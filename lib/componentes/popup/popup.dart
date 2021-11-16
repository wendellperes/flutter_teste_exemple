import 'package:flutter/material.dart';

import '../utils_styles/app_colors.dart';
class Popup extends StatelessWidget {
  final String title;
  final Function FunctionButton1;
  final Function FunctionButton2;
  final String titleButton1;
  final String titleButton2;

  const Popup({Key key, this.title, this.FunctionButton1, this.FunctionButton2, this.titleButton1, this.titleButton2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center,),
      actionsPadding: EdgeInsets.symmetric(horizontal: 60),
      content: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                  onPressed: FunctionButton2,
                  color: Colors.pink ,
                  child: Text(titleButton2)
              ),
              SizedBox(width: 0,),
              FlatButton(
                  onPressed:FunctionButton1,
                  color: AppColors.pinkIcon,
                  child: Text(titleButton1)
              )
            ],
          ),
        ),
     
    );
  }
}
