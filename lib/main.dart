import 'package:flutter/material.dart';
import 'package:speedy/component/RootPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SPEEDY PRINT',
      debugShowCheckedModeBanner: false,
      home: Rootpage(),
    );
  }
}
