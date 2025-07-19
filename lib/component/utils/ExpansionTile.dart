import 'package:flutter/material.dart';

class MyExpansionTile extends StatefulWidget {
  final String label;
  const MyExpansionTile({super.key, required this.label});

  @override
  State<MyExpansionTile> createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  bool _customIcon = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(''),
      trailing: Icon(
          _customIcon ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down),
      children: [
        ListTile(
          title: Text('tessss'),
        ),
      ],
      onExpansionChanged: (bool expanded) {
        setState(() {
          //au changement d'etat l'arrow passe du true au false et vice vers ca
          _customIcon = expanded;
        });
      },
    );
  }
}
