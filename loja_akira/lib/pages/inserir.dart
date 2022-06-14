import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_akira/models/Produtos.dart';
import 'package:loja_akira/pages/widgets/navigation_drawer.dart';

import 'widgets/campo_texto.dart';
import 'widgets/mensagem.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  _InsertPage createState() => _InsertPage();
}

class _InsertPage extends State<InsertPage> {
  var txtNome = TextEditingController();
  var txtPreco = TextEditingController();
  var txtQuantidade = TextEditingController();

  //
  // getDocumentoById
  //
  getDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('produtos')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtPreco.text = doc.get('preco');
      txtQuantidade.text = doc.get('quantidade');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtNome.text.isEmpty && txtPreco.text.isEmpty) {
        getDocumentoById(id);
      }
    }

    return Scaffold(
      
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      backgroundColor: Colors.black,
    ),
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome produto', txtNome, Icons.badge),
            const SizedBox(height: 20),
            campoTexto('Preço', txtPreco, Icons.monetization_on_outlined),
            const SizedBox(height: 20),
            campoTexto('Quantidade', txtQuantidade, Icons.list),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromARGB(255, 71, 71, 71),
                    ),
                    child: const Text('salvar'),
                    onPressed: () {
                      final produto = Produtos(
                        nome: txtNome.text,
                        preco: txtPreco.text,
                        quantidade: txtQuantidade.text,
                      );

                      insertProduct(produto);

                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 120,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromARGB(255, 71, 71, 71),
                      ),
                      child: const Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future insertProduct(Produtos produtos) async{
    final docProdutos = FirebaseFirestore.instance.collection('produtos').doc();
    produtos.id = docProdutos.id;

    final json = produtos.toJson();
    await docProdutos.set(json);
  }
}
