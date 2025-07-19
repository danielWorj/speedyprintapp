import 'package:flutter/material.dart';

class Commentaire extends StatefulWidget {
  const Commentaire({super.key});

  @override
  State<Commentaire> createState() => _CommentaireState();
}

class _CommentaireState extends State<Commentaire> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Commentaire"),
    );
  }
}
