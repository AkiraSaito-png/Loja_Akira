import 'package:flutter/material.dart';
import 'package:loja_akira/pages/widgets/navigation_drawer.dart';

class PrincipalPage extends StatefulWidget{
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPage createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage>{
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color.fromARGB(255, 49, 49, 49),
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      backgroundColor: Colors.black,
    ),
    body: Column(
      children: const [
              Center(
                heightFactor: 2,
                child: Text(
                  'Bem Vindo a página inicial!',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 32,
                  color: Colors.black,
                  )
                ),
              ),
            ]
    ),    
  );
}