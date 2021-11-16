import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_busca/controller_busca.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_delete/controller_delete.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:provider/provider.dart';


class CustomBodyDrawer extends StatefulWidget {
  final BuildContext contexto;
  const CustomBodyDrawer({Key key, this.contexto}) : super(key: key);

  @override
  _CustomBodyDrawerState createState() => _CustomBodyDrawerState();
}

class _CustomBodyDrawerState extends State<CustomBodyDrawer> {
  ControllerDelete controllerDelete;
  ControllerBusca  controllerBusca;
  bool val = false;
  onNotificacao(bool valor){
    setState(()  {
      val = valor;
    });
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controllerDelete = Provider.of<ControllerDelete>(context, listen: false);
    controllerBusca = Provider.of<ControllerBusca>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    bool userStore = true;
    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 5),
      color: Colors.white,
      child: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(left: 14),
            child: Row(
              children: [
                Container(
                    child: Icon(
                      Icons.notifications,
                      color: AppColors.purple,
                    )
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text('Notificações',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              height: 10,
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Switch(
                                      value: val,
                                      onChanged: (newVal){
                                        onNotificacao(newVal);
                                      },
                                      activeTrackColor: AppColors.purple,
                                      activeColor: Colors.white,
                                      hoverColor: Colors.white,
                                      inactiveTrackColor: AppColors.purple,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                      ],
                    )
                ),
              ],
            ),
          ),



          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
          ),

          Divider(color: Colors.black54),
          GestureDetector(
            onTap: () async {

            },
            child: Container(
              child: Text('Sair', style: AppTextStyles.black1,),
            ),
          ),

        ],
      ),
    );
  }
}
