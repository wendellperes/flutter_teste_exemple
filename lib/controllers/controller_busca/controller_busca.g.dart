// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_busca.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerBusca on _ControllerBuscaBase, Store {
  final _$lista_pessoasAtom = Atom(name: '_ControllerBuscaBase.lista_pessoas');

  @override
  List<Map<dynamic, dynamic>> get lista_pessoas {
    _$lista_pessoasAtom.reportRead();
    return super.lista_pessoas;
  }

  @override
  set lista_pessoas(List<Map<dynamic, dynamic>> value) {
    _$lista_pessoasAtom.reportWrite(value, super.lista_pessoas, () {
      super.lista_pessoas = value;
    });
  }

  final _$buscarDadosGeraisAsyncAction =
      AsyncAction('_ControllerBuscaBase.buscarDadosGerais');

  @override
  Future<void> buscarDadosGerais() {
    return _$buscarDadosGeraisAsyncAction.run(() => super.buscarDadosGerais());
  }

  @override
  String toString() {
    return '''
lista_pessoas: ${lista_pessoas}
    ''';
  }
}
