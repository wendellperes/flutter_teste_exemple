import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';

class Splashscreen extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<Splashscreen> {
  void navigationToNextPage() async {
      Navigator.pushReplacementNamed(context, '/presentation');
  }
  

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    //após 5 seconds chama a função que leva para home
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }
  @override
  Widget build(BuildContext context) {
    //usar o SystemUiOverlays para remover a barra de notificação
    SystemChrome.setEnabledSystemUIOverlays([]);

      return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Image.asset('images/logo.png')
                    ),
                  ),
                  SpinKitThreeBounce(
                    color: AppColors.lightGreen,
                    size: 30.0,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
}
