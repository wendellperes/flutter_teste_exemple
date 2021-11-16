import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/utils_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ListViewHorizontal extends StatefulWidget {
  final List listData; 
  final Function function;
  const ListViewHorizontal({ Key key, this.listData, this.function }) : super(key: key);

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: widget.listData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        widget.function(
                          widget.listData[index]['name']
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                           borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
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
                          child: Column(
                            children: [
                              Image.asset('${widget.listData[index]['img']}', height: 60, color: AppColors.pinkIcon,),
                              Text('${widget.listData[index]['name']}', style: AppTextStyles.bodyBold,)
                            ],
                          )
                          ),  
                      ),
                    );
                  }
                  ),
              );
  }
}