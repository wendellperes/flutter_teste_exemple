
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';


part 'controller_busca.g.dart';

class ControllerBusca = _ControllerBuscaBase with _$ControllerBusca;

abstract class _ControllerBuscaBase with Store {
  ControllerGeral controllerGeral =  ControllerGeral();

  @observable
  List<Map> lista_pessoas;
  //Método Responsavel Pela Captura de Dados Gerais
  @action
  Future<void>buscarDadosGerais() async {
    try {
      final Database db = await controllerGeral.getDatabase();
      lista_pessoas =  await db.rawQuery("SELECT *, strftime('%d-%m-%Y',nascimento) as nascimento,  strftime('%d-%m-%Y %H:%M',data_cadastro) as data_cadastro FROM tbl_usuario ");
      // lista_pessoas  = await db.query(
      //   'tbl_usuario',
      // );

      //idCadastro != 0 ? onsuccess(true) : onsuccess(false);
    } catch (ex) {
      print(ex);
      return;
    }
  }

}