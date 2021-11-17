// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_inserir.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerInserir on _ControllerInserirBase, Store {
  final _$idCadastroAtom = Atom(name: '_ControllerInserirBase.idCadastro');

  @override
  int get idCadastro {
    _$idCadastroAtom.reportRead();
    return super.idCadastro;
  }

  @override
  set idCadastro(int value) {
    _$idCadastroAtom.reportWrite(value, super.idCadastro, () {
      super.idCadastro = value;
    });
  }

  final _$CadastrarAsyncAction =
      AsyncAction('_ControllerInserirBase.Cadastrar');

  @override
  Future<void> Cadastrar(
      {String nome,
      String descricao,
      String preco,
      String img,
      Function onsuccess}) {
    return _$CadastrarAsyncAction.run(() => super.Cadastrar(
        nome: nome,
        descricao: descricao,
        preco: preco,
        img: img,
        onsuccess: onsuccess));
  }

  @override
  String toString() {
    return '''
idCadastro: ${idCadastro}
    ''';
  }
}
