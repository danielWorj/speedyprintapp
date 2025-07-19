import 'package:flutter/material.dart';
import 'package:speedy/color/color.dart';

class Baniere extends StatelessWidget {
  final String image;
  const Baniere({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("assets/$image"), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: Offset(0, 10))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Montage Photo",
                      style: TextStyle(
                          color: primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Center(
                  child: Icon(
                    Icons.favorite_border,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          Text("1000 Fcfa",
              style: TextStyle(
                  color: secondary, fontSize: 30, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
