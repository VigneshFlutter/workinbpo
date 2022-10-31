import 'package:flutter/material.dart';

void successSnackBar(String data , BuildContext context){
  final snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text(data , style: const TextStyle(color: Colors.white),),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void errorSnackBar(String data , BuildContext context){
  final snackBar = SnackBar(
    backgroundColor: Colors.redAccent,
      content: Text(data , style: const TextStyle(color: Colors.white),));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}