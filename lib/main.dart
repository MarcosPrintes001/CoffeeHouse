// ignore_for_file: depend_on_referenced_packages

import 'package:coffee_house/auth/auth.dart';
import 'package:coffee_house/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => const MaterialApp(
        title: "Coffe\nHouse",
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}
