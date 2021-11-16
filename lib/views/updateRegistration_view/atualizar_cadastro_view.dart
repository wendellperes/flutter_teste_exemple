import 'dart:ffi';

import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_border_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/button_custom/button_custom.dart';
import 'package:avaliacao_empresa_flutter/componentes/loading/loading.dart';
import 'package:avaliacao_empresa_flutter/componentes/popup/popup.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_inserir/controller_inserir.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_update/controller_update.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateUser extends StatefulWidget {
  final  user;

  const UpdateUser({Key key, this.user}) : super(key: key);


  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey                          = GlobalKey<ScaffoldState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _emailControle = TextEditingController();
  final TextEditingController _dataNascimento = TextEditingController();
  DateTime nascimento_format;
  final String _dataControler                    = DateTime.now().toString();
  bool isAtualizando = false;
  String sexo;
  ControllerUpdate controllerUpdate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NativeApi.initializeApiDLData.address.toString();
    _nome.text             = widget.user['nome'];
    _emailControle.text    = widget.user['email'];

    var campos = widget.user['nascimento'].split('-');
    int dia = int.parse(campos[0]);
    int mes = int.parse(campos[1]);
    int ano = int.parse(campos[2]);

    nascimento_format = DateTime(ano,mes,dia);
    _dataNascimento.text   = nascimento_format.toString();
    sexo                   = widget.user['sexo'];
    print(_dataNascimento);



  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controllerUpdate = Provider.of<ControllerUpdate>(context, listen: false);
  }
  _onsuccess( bool response){
    if (response == true){
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Atualizando...'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Error ao tentar Atualizar'),
        backgroundColor: Colors.red,
      ));
    }
  }
  void dropChange(String val){
    sexo = val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Container(
            color: Colors.white,
            child: isAtualizando != true ? Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'images/logo-teste2.jpg',
                        width: 180,
                        height: 180,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Atualizar Dados do Usuario',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0, top:15.0, right: 26.0, bottom: 0.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _nome,
                              keyboardType: TextInputType.text,
                              maxLength: 70,
                              decoration: InputDecoration(
                                labelText: 'Nome*',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                ),
                                disabledBorder: disabledBorder,
                                enabledBorder: enabledBorder,
                                focusedBorder: focusedBorder,
                                border:  border,
                              ),
                              validator: (value){
                                if ( value.isEmpty){
                                  return 'Campo nao pode ser vazio';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _emailControle,
                              keyboardType: TextInputType.emailAddress,

                              decoration: InputDecoration(
                                labelText: 'Email*',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                ),
                                disabledBorder: disabledBorder,
                                enabledBorder: enabledBorder,
                                focusedBorder: focusedBorder,
                                border:  border,
                              ),
                              validator: (value){
                                if ( value.isEmpty){
                                  return 'Campo nao pode ser vazio';
                                } else if(!value.contains('@')){
                                  return 'e-mail Inválido!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DateTimePicker(
                              type: DateTimePickerType.date,
                              decoration: InputDecoration(
                                labelText: 'Data Nascimento*',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                ),
                                disabledBorder: disabledBorder,
                                enabledBorder: enabledBorder,
                                focusedBorder: focusedBorder,
                                border:  border,
                              ),
                              dateMask: 'dd/MM/yyyy',
                              firstDate: DateTime(1500),
                              lastDate: DateTime(2100),
                              timeLabelText: "Horas",
                              controller: _dataNascimento,
                              locale: Locale("pt", "BR"),

                              onChanged: (val) async {
                                _dataNascimento.text = val;
                              },
                              validator: (value){
                                if ( value.isEmpty){
                                  return 'Campo nao pode ser vazio';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: 'Sexo',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                ),
                                disabledBorder: disabledBorder,
                                enabledBorder: enabledBorder,
                                focusedBorder: focusedBorder,
                                border:  border,
                              ),
                              value: sexo,
                              validator: (value){
                                if ( value.isEmpty){
                                  return 'Campo nao pode ser vazio';
                                }
                                return null;
                              },
                              onChanged: dropChange,
                              items: <String>['Masculino', 'Feminino', 'Indiferente']
                                  .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    value,
                                  ),
                                  value: value,
                                );
                              }).toList(),

                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonCustom(
                            title: 'Cancelar',
                            color: AppColors.darkRed,
                            ontap: (){
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      Popup(
                                        title: 'Você realmente Deseja Fechar a Tela?',
                                        titleButton1: 'Sim',
                                        titleButton2: 'Não',
                                        FunctionButton1: (){
                                          Navigator.pushReplacementNamed(context, '/home');
                                        },
                                        FunctionButton2: (){
                                          Navigator.pop(context);
                                        },
                                      )
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ButtonCustom(
                            title: 'Atualizar',
                            color: AppColors.purple,
                            ontap: () async {
                              if(_formKey.currentState.validate()){
                                setState(() {
                                  isAtualizando = true;
                                });
                                await controllerUpdate.Atualizar(
                                  id: widget.user['id'],
                                  nome: _nome.text,
                                  email: _emailControle.text,
                                  data_nascimento:  _dataNascimento.text,
                                  sexo: sexo,
                                  data: _dataControler,
                                  onsuccess: _onsuccess
                                );
                                //
                                // await controllerInserir.Cadastrar(
                                //     nome: _nome.text,
                                //     email: _emailControle.text,
                                //     data_nascimento: _dataNascimento.text,
                                //     sexo: sexo,
                                //     data: _dataControler,
                                //     onsuccess: _onsuccess
                                // );

                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    //montagem do butão com padding para ajustar seu tamanho

                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ) : LoadingPage(title: 'Atualizando...',)
        )

    );
  }
}