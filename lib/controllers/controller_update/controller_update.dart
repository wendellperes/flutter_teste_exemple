import 'dart:io';
import 'dart:async';
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:avaliacao_empresa_flutter/models/usuario_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_update.g.dart';

class ControllerUpdate = _ControllerUpdateBase with _$ControllerUpdate;

abstract class _ControllerUpdateBase with Store {
  ControllerGeral controllerGeral =  ControllerGeral();
  @observable
  int idCadastro;
  @observable
  int idade;
  @action
  Future<void>Atualizar({
    @required int id,
    @required String nome,
    @required String email,
    @required String  data_nascimento,
    @required String sexo,
    @required String data,
    @required Function onsuccess,}
      ) async {

    try {
      final Database db = await controllerGeral.getDatabase();
      //Retira espacos vazios e com pontos para ele rodar no split
      String dataNasc = data_nascimento.replaceAll('0', '').replaceAll(':', '')
          .replaceAll(' ', '').replaceAll('.', '');

      var campos = dataNasc.split('-',);
      int ano = int.parse(campos[0]);
      int mes = int.parse(campos[1]);
      int dia = int.parse(campos[2]);

      DateTime nascimento_format = DateTime(ano,mes,dia,);
      DateTime hoje = DateTime.now();
      //Bloco Responsavel por pegar a idade do usuarios
      idade = hoje.year - nascimento_format.year;
      if (hoje.month<nascimento_format.month)
        idade--;
      else if (hoje.month==nascimento_format.month){
        if (hoje.day<nascimento_format.day)
          idade--;
      }

      //////
      var dados =  Usuario(
          id: id,
          name: nome,
          email: email,
          nascimento: data_nascimento,
          sexo: sexo,
          idade: idade,
          data_criacao: data
      );
      await db.update(
        'tbl_usuario',
        dados.toMap(),
        where: "id = ?",
        whereArgs: [id],
      );
      onsuccess(true);
    } catch (ex) {
      onsuccess(false);
      print(ex);
      return;
    }



  }

}