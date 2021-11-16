
import 'dart:async';
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:avaliacao_empresa_flutter/models/usuario_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_inserir.g.dart';

class ControllerInserir = _ControllerInserirBase with _$ControllerInserir;

abstract class _ControllerInserirBase with Store {
  ControllerGeral controllerGeral =  ControllerGeral();
@observable
 int idCadastro;
@observable
 int idade;
@action
  Future<void>Cadastrar({
  @required String nome,
  @required String email,
  @required String  data_nascimento,
  @required String sexo,
  @required String data,
  @required Function onsuccess,}
  ) async {

   try {
     final Database db = await controllerGeral.getDatabase();
     //Bloco Responsavel por pegar a idade do usuarios
     var campos = data_nascimento.split('-');
     int ano = int.parse(campos[0]);
     int mes = int.parse(campos[1]);
     int dia = int.parse(campos[2]);

     DateTime nascimento_format = DateTime(ano,mes,dia,);
     DateTime hoje = DateTime.now();

     idade = hoje.year - nascimento_format.year;
     if (hoje.month<nascimento_format.month)
       idade--;
     else if (hoje.month==nascimento_format.month){
       if (hoje.day<nascimento_format.day)
         idade--;
     }

     //////
     var dados =  Usuario(
         name: nome,
         email: email,
         nascimento: data_nascimento,
         sexo: sexo,
         idade: idade,
         data_criacao: data
     );
     print(idade);
     idCadastro  = await db.insert(
       'tbl_usuario',
       dados.toMap(),
     );
     idCadastro != 0 ? onsuccess(true) : onsuccess(false);
   } catch (ex) {
     print(ex);
     return;
   }



  }



}