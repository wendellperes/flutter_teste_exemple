class Produto {
  //será mudado para produtos
   String name         = '';
   String descricao        = '';
   String preco   = '';
   String img   = '';

  Produto({ this.name, this.descricao, this.preco, this.img, });

  Map<String, dynamic>toMap(){
    return{
      'nome': name,
      'descricao': descricao,
      'preco': preco,
      'img': img,
    };
  }

}