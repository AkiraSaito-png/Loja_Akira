import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_akira/pages/Criar_conta.dart';
import 'package:loja_akira/pages/estoque.dart';
import 'package:loja_akira/pages/inserir.dart';
import 'package:loja_akira/pages/login.dart';
import 'package:loja_akira/pages/principal.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja do Akira',
      initialRoute: 'login',
      routes: {
        'login': (context) => const Login(),
        'principal':(context) => const PrincipalPage(),
        'sign_up':(context) => const CriarContaPage(),
        'inserir':(context) => const InsertPage(),
        'estoque': (context) => const InventoryPage(),        
      },
    );
}