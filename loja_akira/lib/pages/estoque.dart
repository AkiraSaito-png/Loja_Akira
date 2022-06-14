import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_akira/models/Produtos.dart';
import 'package:loja_akira/pages/widgets/mensagem.dart';
import 'package:loja_akira/pages/widgets/navigation_drawer.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  _InventoryPage createState() => _InventoryPage();
}

class _InventoryPage extends State<InventoryPage> {
  var prod;
  Stream<List<Produtos>> readProducts() => FirebaseFirestore.instance
  .collection('produtos')
  .snapshots()
  .map((snapshots)=>
    snapshots.docs.map((doc) => Produtos.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: StreamBuilder<List<Produtos>>(
          stream: readProducts(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final produtos = snapshot.data!;
              return ListView(
                children: produtos.map(buildProducts).toList(),
              );
            }
            else if(snapshot.hasError){
              return Text('Erro ao conectar');
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildProducts (Produtos produtos) => ListTile(
      leading: CircleAvatar(
      child: Text('${produtos.nome}')),
      title: Text('${produtos.preco} reais'),
      subtitle: Text('${produtos.quantidade} unidades'),

      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () {
          prod.doc(produtos.id).delete();
          sucesso(context, 'O documento foi apagado com sucesso.');
        },
      ),
    );
}
