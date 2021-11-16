import 'dart:io';
import 'dart:async';
import 'package:avaliacao_empresa_flutter/controllers/controller_busca/controller_busca.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:avaliacao_empresa_flutter/models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_delete.g.dart';

class ControllerDelete = _ControllerDeleteBase with _$ControllerDelete;

abstract class _ControllerDeleteBase with Store {
  ControllerGeral controllerGeral =  ControllerGeral();
  @action
  Future<void>deletarDados({@ required int id}) async {
    try {
      final Database db = await controllerGeral.getDatabase();
      await db.delete(
        'tbl_usuario',
        where: "id = ?",
        whereArgs: [id],
      );
      return true;

      //idCadastro != 0 ? onsuccess(true) : onsuccess(false);
    } catch (ex) {
      print(ex);
      return;
    }
  }


}