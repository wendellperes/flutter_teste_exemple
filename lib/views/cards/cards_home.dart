import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/popup/popup.dart';
import 'package:avaliacao_empresa_flutter/componentes/popup/popup_confirma%C3%A7%C3%A3o.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_delete/controller_delete.dart';
import 'package:avaliacao_empresa_flutter/views/updateRegistration_view/atualizar_cadastro_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cards extends StatefulWidget {
  final List listPesoas;
  const Cards({Key key, this.listPesoas, }) : super(key: key);
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  ControllerDelete controllerDelete;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controllerDelete = Provider.of<ControllerDelete>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.listPesoas.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) =>
                          Popup(
                            title: 'O que você Deseja Fazer?',
                            titleButton1: 'Remover',
                            FunctionButton1: () async {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (context) => Popup(
                                    title: 'Você Realmente deseja Remover este Usuario?',
                                    titleButton1: 'Sim',
                                    FunctionButton1: () async{
                                      await controllerDelete.deletarDados(id: widget.listPesoas[index]['id']);

                                      Navigator.pushReplacementNamed(context, '/home');
                                    },
                                    titleButton2: 'Não',
                                    FunctionButton2: (){
                                      Navigator.pop(context);
                                    },
                                  )
                              );
                            },
                            titleButton2: 'Editar',
                            FunctionButton2: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateUser( user: widget.listPesoas[index])
                                  )
                              );
                            },
                          )
                  );
                },
                child: Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.purple,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Nome: ', style: AppTextStyles.heading,),
                                    Text('${widget.listPesoas[index]['nome']}', style: AppTextStyles.bodylightGrey,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Email: ', style: AppTextStyles.heading,),
                                Text('${widget.listPesoas[index]['email']}', style: AppTextStyles.bodylightGrey,),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Nascimento: ', style: AppTextStyles.heading,),
                                Text('${widget.listPesoas[index]['nascimento']}', style: AppTextStyles.bodylightGrey,),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Idade: ', style: AppTextStyles.heading,),
                                Text('${widget.listPesoas[index]['idade']}', style: AppTextStyles.bodylightGrey,),

                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Sexo: ', style: AppTextStyles.heading,),
                                Text('${widget.listPesoas[index]['sexo']}', style: AppTextStyles.bodylightGrey,),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Data Cadastro: ', style: AppTextStyles.heading,),
                                Text('${widget.listPesoas[index]['data_cadastro']}' , style: AppTextStyles.bodylightGrey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              );
            }
        )
    );
  }
}
