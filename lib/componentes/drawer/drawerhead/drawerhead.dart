
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_delete/controller_delete.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:provider/provider.dart';

class CustomHeader extends StatefulWidget {
  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(right: 20, left: 0, top: 15, bottom: 0),
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage('images/icons/personagem.jpg'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Text(
                            'wendell peres da costa',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          'ID: 12345',
                          style: TextStyle(color: Color(0xff4f4f4f), fontSize: 13, fontFamily: 'SourceSansPro'))
                    ],
                  ),
                  GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                    child: Container(
                      //color: Colors.red,
                      height: 80,
                      width: 80,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 10),
                      child: Icon(Icons.clear),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

          ],
        ));
  }
}