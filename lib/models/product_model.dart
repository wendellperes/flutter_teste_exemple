class Produto {
  //será mudado para produtos
   String name         = '';
   String descricao        = '';
   String preco   = '';

  Produto({ this.name, this.descricao, this.preco, });

  Map<String, dynamic>toMap(){
    return{
      'nome': name,
      'descricao': descricao,
      'preco': preco,
    };
  }

}