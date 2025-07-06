import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  Drink({super.key, required this.image, required this.name, required this.title});
  final String image;
  final String name;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 3),
                child: Row(),
              )),
        ),
        Positioned(
            top: 100,
            left: 31,
            bottom: 19,
            child: Container(
              width: 70,
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    blurRadius: 30, spreadRadius: 1, color: Colors.black54)
              ]),
            )),
        Positioned(
            top: -10,
            left: 20,
            bottom: 45,
            child: Image.asset(
             image,
              fit: BoxFit.contain,
            )),
        Positioned(
            top: 70,
            right: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 name,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            )),
        Positioned(
            top: 135,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black26)),
              child: Icon(
                Icons.arrow_forward,
                size: 20,
                color: Colors.black45,
              ),
            ))
      ],
    );
  }
}
