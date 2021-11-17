
import 'dart:convert';

import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';


part 'controller_busca.g.dart';

class ControllerBusca = _ControllerBuscaBase with _$ControllerBusca;

abstract class _ControllerBuscaBase with Store {
  ControllerGeral controllerGeral =  ControllerGeral();
  FirebaseFirestore instance = FirebaseFirestore.instance;

  @observable
  List<Map> lista_pessoas;
  @observable
  List <Map<String, dynamic>> dataProdutos = [];
  //Método Responsavel Pela Captura de Dados Gerais
  @action
  Future<void>buscarDadosGerais() async {
    try {
      dataProdutos.clear();
      QuerySnapshot<Map<String, dynamic>> dados = await instance
        .collection('anuncios')
        .get();
      dados.docs.forEach((element) {
        //print(element.data());
        dataProdutos.add(element.data());
      });


    } catch (ex) {
      print(ex);
      return;
    }
  }

}