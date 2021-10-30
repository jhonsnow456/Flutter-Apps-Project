import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_app/components/login.dart';

import 'package:notes_app/services/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes Application',
      theme: ThemeData.light().copyWith(
        primaryColor: kTextColor,
        accentColor: kTextColor,
      ),
      home: LoginPage(),
    );
  }
}