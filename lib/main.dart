// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:socialnetwork/dashboard.dart';
import 'package:socialnetwork/feedpage.dart';
import 'package:socialnetwork/homepage.dart';
import 'package:socialnetwork/login.dart';
import 'package:socialnetwork/register.dart';

import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ashesi Social Media',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterPage(),
    );
  }
}
