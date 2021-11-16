import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
class ButtonCustom extends StatefulWidget {
  final Function ontap;
  final String title;
  final Color color;

  const ButtonCustom({Key key, this.ontap, this.title, this.color}) : super(key: key);
  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        color: widget.color,
        onPressed: widget.ontap,
        child: Text(widget.title, style: AppTextStyles.title,),
      ),
    );
  }
}
