import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 117, 117, 117),
        appBar: AppBar(
          title: Text("I WAS RICH"),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),

        ),
        body: Center(
          child: Image.file(File('images/red_diamond.png')),
          ),
        ),
      ),
    );
}