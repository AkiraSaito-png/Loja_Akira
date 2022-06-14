import 'package:cloud_firestore/cloud_firestore.dart';

class Produtos {
  String id;
  String nome;
  String preco;
  String quantidade;

  Produtos({this.id = '',
            required this.nome,
            required this.preco,
            required this.quantidade});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'preco': preco,
    'quantidade': quantidade,
  };

  static Produtos fromJson(Map<String, dynamic> json) => Produtos(
    id: json['id'],
    nome: json['nome'], 
    preco: json['preco'],
    quantidade: json['quantidade'],
    );
}
