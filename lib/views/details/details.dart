import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsProduct extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const DetailsProduct({ Key key, this.arguments }) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {

  int qdt = 1;
  int preco = 0;
  int total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preco = int.parse(widget.arguments['preco']);
    total = int.parse(widget.arguments['preco']);
    print('${widget.arguments['nome']}');
  }
  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            AppBar(
                leading: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop(context);
                  },
                  icon: Icon(Icons.keyboard_arrow_left_outlined, size: 40, color: Colors.black,),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[300], 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)
                        )
                      ),
                      onPressed: (){},
                      child: Icon(Icons.favorite_rounded),
                    ),
                  )
                ],
                backgroundColor: Colors.white,
                elevation: 0,
              ),
            Container(
              height: 300,
              width: 250,
              child: Image.network('${widget.arguments['img']}',),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                '${widget.arguments['nome']}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                '${widget.arguments['descricao']}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: AppColors.border,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                'Tamanhos', 
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.4,
                              blurRadius: 3,
                              offset: Offset(0, -2), 
                            ),
                          ],
                    ),
                    child: Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.4,
                              blurRadius: 3,
                              offset: Offset(0, -2), 
                            ),
                          ],
                    ),
                    child: Center(
                      child: Text(
                        'M',
                        style: TextStyle(
                          color: AppColors.pinkIcon,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.4,
                              blurRadius: 3,
                              offset: Offset(0, -2), 
                            ),
                          ],
                    ),
                    child: Center(
                      child: Text(
                        'G',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantidade',
                    style: TextStyle(
                          color: AppColors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),
                  ),
                  Text(
                    'Total',
                    style: TextStyle(
                          color: AppColors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            setState(() {
                              if(qdt >= 2){
                                qdt--;
                                total = total - preco;
                              }
                              
                            });
                          }, 
                          icon: Icon(Icons.remove)
                        ),
                        Text('$qdt'),
                        IconButton(
                          onPressed: (){
                            setState(() {
                              qdt++;
                               total = preco * qdt;
                               print(total);
                            });
                          }, 
                          icon: Icon(Icons.add)
                        ),

                      ],
                    ),
                  ),
                  Container(
                    child: Text('R\$ $total,00'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                  onPressed: (){},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        Text('Adicionar ao Carrinho')
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}