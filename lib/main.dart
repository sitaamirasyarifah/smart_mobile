import 'package:flutter/material.dart';
import 'package:smart_mobile/screens/menu.dart';
import 'package:smart_mobile/widget/model.dart';


List<Barang> modelList = [];
void main() {

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMart - Sita Mart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      
    );
  }
}