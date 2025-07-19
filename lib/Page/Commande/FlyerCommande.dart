import 'package:flutter/material.dart';

class FlyerCommandePage extends StatefulWidget {
  const FlyerCommandePage({super.key});

  @override
  State<FlyerCommandePage> createState() => _FlyerCommandePageState();
}

class _FlyerCommandePageState extends State<FlyerCommandePage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text("Flyer page"),
      ),
    );
  }
}
