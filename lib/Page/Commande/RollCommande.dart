import 'package:flutter/material.dart';

class RollCommandePage extends StatefulWidget {
  const RollCommandePage({super.key});

  @override
  State<RollCommandePage> createState() => _RollCommandePageState();
}

class _RollCommandePageState extends State<RollCommandePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Roll page"),
      ),
    );
  }
}
