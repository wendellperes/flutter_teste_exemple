class Usuario {
  //será mudado para produtos
   int id = 0;
   String name         = '';
   String email        = '';
   String nascimento   = '';
   String sexo         = '';
   int    idade        =  0;
   String data_criacao = '';

  Usuario({this.id, this.name, this.email, this.nascimento, this.sexo, this.idade, this.data_criacao });

  Map<String, dynamic>toMap(){
    return{
      'id': id,
      'nome': name,
      'email': email,
      'nascimento': nascimento,
      'sexo': sexo,
      'idade': idade,
      'data_cadastro': data_criacao
    };
  }

}