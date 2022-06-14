import 'package:flutter/material.dart';
import 'package:loja_akira/pages/estoque.dart';
import 'package:loja_akira/pages/inserir.dart';
import 'package:loja_akira/pages/principal.dart';
import 'package:loja_akira/pages/sobre.dart';

class NavigationDrawerWidget extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(children: <Widget>[
          const SizedBox(height: 48),
          buildMenuItem(
            text: 'Início',
            icon: Icons.home,
            onClicked: () => selectedItem(context, 0),
          ),
          buildMenuItem(
            text: 'Estoque',
            icon: Icons.inventory,
            onClicked: () => selectedItem(context, 1),
          ),
          buildMenuItem(
            text: 'Registrar produto',
            icon: Icons.app_registration_rounded,
            onClicked: () => selectedItem(context, 2),
          ),
          buildMenuItem(
            text: 'Sobre',
            icon: Icons.info,
            onClicked: () => selectedItem(context, 3),
          ),
        ],),
      ),
    );
  }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index){
      case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrincipalPage(),));
      break;
      case 1:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InventoryPage(),));
      break;
      case 2:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsertPage(),));
      break;
      case 3:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage(),));
      break;
    }
  }
}