import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/views/home_view/home.dart';
import 'package:avaliacao_empresa_flutter/views/home_view/home_tab_views.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

class PresentationView extends StatelessWidget {
  const PresentationView({ Key key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
      children: <Widget>[
        new Image.asset(
          'images/img_presentation.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        Positioned(
          bottom: 15.0,
          left: 20.0,
          top: size.height * 0.4,
          child: Text(
            "Bazar Shop",
            style: AppTextStyles.titleApresentation
          ),
        ),
        Positioned(
          bottom: 15.0,
          left: 20.0,
          top: size.height * 0.49,
          child: Container(
            width: size.width * 0.9,
            child: Text(
              "Compre as Melhores peças e Anúncie as suas peças",
              textAlign: TextAlign.left,
              style: AppTextStyles.subTitleApresentation
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.3,
          left: size.height * 0.10,
          child: Container(
            height: 80,
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeTabView()),
                );
              }, 
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Icon(Icons.arrow_right_alt_outlined, color: Colors.white,)
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text('Continuar', style: AppTextStyles.titleBold,),
                    )
                  ],
                ),
              )
              ),
          )
        ),
      ],
    )
      
    );
  }
}