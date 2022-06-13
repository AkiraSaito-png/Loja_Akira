import 'package:flutter/material.dart';

campoTexto(texto, controller, icone, {senha}) {
  return TextField(
    controller: controller,
    obscureText: senha != null ? true : false,
    style: const TextStyle(
      color: Color.fromARGB(255, 71, 71, 71),
      fontWeight: FontWeight.w300,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icone, color: Color.fromARGB(255, 71, 71, 71)),
      prefixIconColor: Color.fromARGB(255, 71, 71, 71),
      labelText: texto,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 71, 71, 71)),
      border: const OutlineInputBorder(),
      focusColor: Color.fromARGB(255, 71, 71, 71),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 71, 71, 71),
          width: 1.0,
        ),
      ),
    ),
  );
}
