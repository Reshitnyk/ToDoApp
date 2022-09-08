import 'package:flutter/material.dart';
import 'activities/home.dart';
import 'activities/start_screen.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(),
        '/second_page': (context) => Home(),
      },
    ));
