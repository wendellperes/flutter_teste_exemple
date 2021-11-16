
import 'package:avaliacao_empresa_flutter/componentes/drawer/drawer_icon.dart';
import 'package:avaliacao_empresa_flutter/componentes/listView_horizontal/listView_hotizontal.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_border_styles.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_busca/controller_busca.dart';
import 'package:avaliacao_empresa_flutter/views/createRegistration_view/createProduct.dart';
import 'package:avaliacao_empresa_flutter/views/details/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/drawer/drawer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:avaliacao_empresa_flutter/models/categories_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  ControllerBusca controllerBusca = ControllerBusca();
  
  final TextEditingController _pesquisa = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${categories}');
  }
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
     controllerBusca = Provider.of<ControllerBusca>(context, listen: false);
     controllerBusca.buscarDadosGerais();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      drawer: CustomDrawer(),
      body:  SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconDrawer(),
      
                    Container(
                      child: IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(), 
                        icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,)
                      ),
                    )
                  ],
                )
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text('Bazar Shop', style: AppTextStyles.heading40,),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text('Obtenha Roupas Fashion', style: AppTextStyles.heading,),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: TextFormField(
                        controller: _pesquisa,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Procure as Roupas que você precisa...',
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                          ),
                          disabledBorder: disabledBorder,
                          enabledBorder: enabledBorder,
                          focusedBorder: focusedBorder,
                          border:  border,
                          prefixIcon: Icon(Icons.search_outlined)
                        ),
                        validator: (value){
                          if ( value.isEmpty){
                            return 'Campo nao pode ser vazio';
                          }
                          return null;
                        },
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text('Categorias', style: AppTextStyles.heading,),
              ),
              SizedBox(
                height: 15,
              ),
              ListViewHorizontal(
                listData: categories,
                function: (value){
                  print('${value}');
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text('Popular Fashion', style: AppTextStyles.heading,),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2 ,
                    children: List.generate(50,(index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailsProduct()),
                          );
                        },
                        child: Container(
                          width: 120,
                          height: 180,
                          margin: EdgeInsets.only(right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'images/img_products/jaqueta1.jpg',
                              ),
                              scale: 8.0
                            ),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                              children: [
                                //Image.asset('images/img_products/jaqueta1.jpg', height: 50,),
                                Container(
                                  width: 60,
                                  height: 50,
                                  margin: EdgeInsets.only(left: 100),
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                      )
                                    ),
                                    onPressed: (){}, 
                                    child: Icon(Icons.favorite_border_outlined, color: AppColors.pinkIcon,)
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                ),
                                Container(
                                  child: Text(
                                    'Jaqueta', 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('R\$ 67,00', style: AppTextStyles.precoDesconto
                                      ),
                                      Text('R\$ 42,00', style: AppTextStyles.precoPrincipal
                                      ),
                                    ],
                                  ),
                                )
                                
                              ],
                            )
                        ),
                      );
                    }),
                  ),
              ),
            
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.pinkIcon,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateProduct()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
