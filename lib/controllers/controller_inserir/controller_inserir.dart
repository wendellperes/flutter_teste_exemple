
import 'dart:async';
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:avaliacao_empresa_flutter/models/product_model.dart';
import 'package:avaliacao_empresa_flutter/models/usuario_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_inserir.g.dart';

class ControllerInserir = _ControllerInserirBase with _$ControllerInserir;

abstract class _ControllerInserirBase with Store {
  ControllerGeral controllerGeral =  ControllerGeral();
  FirebaseFirestore instance = FirebaseFirestore.instance; 
@observable
 int idCadastro;
@action
  Future<void>Cadastrar({
  @required String nome,
  @required String descricao,
  @required String preco,
  @required String img,
  @required Function onsuccess,
  }) async {
   try {
     final data = Produto (
        name: nome,
        descricao: descricao,
        preco: preco,
        img: img
    );
    await instance.collection('anuncios').doc().set(data.toMap()).then((value){
      return onsuccess(true);
    });
   } catch (ex) {
     print(ex);
     return;
   }



  }



}