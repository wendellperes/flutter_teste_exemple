import 'package:avaliacao_empresa_flutter/views/createRegistration_view/createProduct.dart';
import 'package:avaliacao_empresa_flutter/views/details/details.dart';
import 'package:avaliacao_empresa_flutter/views/home_view/home_tab_views.dart';
import 'package:avaliacao_empresa_flutter/views/presentation/presentation.dart';
import 'package:avaliacao_empresa_flutter/views/updateRegistration_view/atualizar_cadastro_view.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_busca/controller_busca.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_delete/controller_delete.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'controllers/controller_inserir/controller_inserir.dart';
import 'controllers/controller_update/controller_update.dart';
import 'views/home_view/home.dart';
import 'views/splashscreen_view/splashscreen_page.dart';

void main() async {
  runApp(
    MultiProvider(
        providers: [
          Provider<ControllerGeral>(
            create: (_) => ControllerGeral(),
          ),
          Provider<ControllerBusca>(
            create: (_) => ControllerBusca(),
          ),
          Provider<ControllerInserir>(
            create: (_) => ControllerInserir(),
          ),
          Provider<ControllerUpdate>(
            create: (_) => ControllerUpdate(),
          ),
          Provider<ControllerDelete>(
            create: (_) => ControllerDelete(),
          ),
        ],
       child: MyApp(),
    )

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVC - App Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        //uso Rotas Nomeadas
        '/': (context) => Splashscreen(),
        '/home': (context) => HomeTabView(),
        '/update': (context) => UpdateUser(),
        '/presentation': (context) => PresentationView(),
        
      },
      initialRoute: '/',
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('pt', 'BR')],
    );
  }
}
