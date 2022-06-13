class Produtos {
  String id;
  String nome;
  String preco;

  Produtos(this.id, this.nome, this.preco);

  factory Produtos.fromJson(String id, Map<String, dynamic> json) {
    return Produtos(
      id,
      json['nome'],
      json['preco'],
    );
  }
}
