import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_akira/pages/widgets/campo_texto.dart';
import 'package:loja_akira/pages/widgets/mensagem.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key:key);

  @override 
  _Login createState() => _Login();
}

class _Login extends State<Login>{
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            const SizedBox(height: 70),
            campoTexto('Email', txtEmail, Icons.email),
            const SizedBox(height: 20),
            campoTexto('Senha', txtSenha, Icons.lock, senha: true),
            const SizedBox(height: 40),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 255, 255),
                minimumSize: const Size(200, 45),
                backgroundColor: Color.fromARGB(255, 71, 71, 71),
              ),
              child: const Text('entrar'),
              onPressed: () {
                login(txtEmail.text, txtSenha.text);
              },
            ),
            const SizedBox(height: 50),
            TextButton(
              style: OutlinedButton.styleFrom(
                primary: Color.fromARGB(255, 71, 71, 71),
              ),
              child: const Text('Criar conta'),
              onPressed: () {
                Navigator.pushNamed(context, 'sign_up');
              },
            ),
          ],
        ),
      ),
    );
  }

  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      sucesso(context, 'Usuário autenticado com sucesso!');

      Navigator.pushReplacementNamed(context, 'principal');
      
    }).catchError((e) {
      //print('LOGIN ERRO: ' + e.code.toString());

      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }
}