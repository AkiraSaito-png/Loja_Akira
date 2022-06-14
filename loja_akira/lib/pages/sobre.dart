import 'package:flutter/material.dart';
import 'package:loja_akira/pages/widgets/navigation_drawer.dart';

class InfoPage extends StatefulWidget{
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPage createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage>{
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color.fromARGB(255, 49, 49, 49),
    appBar: AppBar(
      backgroundColor: Colors.black,
    ),
    body: Column(children: const [
      Center(
        child: 
        Text('Seja bem vindo a central de gerenciamento da loja!\nEste ambiente é destinado aos funcionários, com o intuito de facilitar o gerenciamento local.\nAqui é possível cadastrar produtos, executar vendas e excluir itens.\nOs dados dos produtos são compartilhados com todas as contas afim de manter todos devidamente atualizados. ', style: TextStyle(fontStyle: FontStyle.italic),),
      )
    ]),
  );
}