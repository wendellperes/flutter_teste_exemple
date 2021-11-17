import 'dart:ffi';
import 'dart:io';

import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_border_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/button_custom/button_custom.dart';
import 'package:avaliacao_empresa_flutter/componentes/loading/loading.dart';
import 'package:avaliacao_empresa_flutter/componentes/popup/popup.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_inserir/controller_inserir.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateProduct extends StatefulWidget {
  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey                          = GlobalKey<ScaffoldState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  String img = '';
  bool isSalvando = false;
  ControllerInserir controllerInserir;
  final FirebaseStorage storage =FirebaseStorage.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controllerInserir = Provider.of<ControllerInserir>(context, listen: false);
  }
  _onsuccess( bool response){
    if (response == true){
      print(response);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Cadastrando...'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Error ao tentar Cadastrar'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<XFile>getImage() async {
    final ImagePicker _pick = ImagePicker();
    XFile image = await _pick.pickImage(source: ImageSource.gallery);
    return image;
  }
  Future<void> upload(String path) async{
    File file = File(path);
    try{
      String ref = 'images/img-${DateTime.now().toString()}.jpg';
     var data = await storage.ref(ref).putFile(file);
     String url = await data.ref.getDownloadURL();
     img = url;

    } on FirebaseException catch (e){
      throw Exception('Error no upload: ${e.code}');
    }
  }
  pickUploadImage() async {
    XFile file = await getImage();
    if (file != null){
      await upload(file.path);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Container(
          color: Colors.white,
          child: isSalvando != true ? Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'images/logo.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Cadastrar Produto',
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
                            decoration: InputDecoration(
                              labelText: 'Nome do Produto*',
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
                            controller: _descricao,
                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                              labelText: 'Descrição*',
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
                            controller: _preco,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Preço*',
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
                          ElevatedButton(
                              onPressed: pickUploadImage,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white
                              ),
                              child: Icon(Icons.add_a_photo_rounded, color: Colors.pink[300],)
                          )

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
                                      title: 'Você realmente deseja cancelar ?',
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
                          title: 'Adicionar',
                          color: Colors.pink[300],
                          ontap: () async {
                            if(_formKey.currentState.validate()){
                              setState(() {
                                isSalvando = true;
                              });
                              await controllerInserir.Cadastrar(
                                nome: _nome.text,
                                descricao: _descricao.text,
                                preco: _preco.text,
                                onsuccess: _onsuccess
                              );
                              //
                              //await controllerInserir.Cadastrar(
                              //  nome: _nome.text,
                              //  email: _emailControle.text,
                              //  data_nascimento: _dataNascimento.text,
                              //  sexo: sexo,
                              //  data: _dataControler,
                              //  onsuccess: _onsuccess
                              //);

                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  //montagem do butão com padding para ajustar seu tamanho

                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ) : LoadingPage(title: 'Salvando...',)
        )

    );
  }
}