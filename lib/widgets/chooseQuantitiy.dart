import 'package:flutter/material.dart';

class Choosequantitiy extends StatefulWidget {
  const Choosequantitiy({super.key});

  @override
  State<Choosequantitiy> createState() => _ChoosequantitiState();
}

class _ChoosequantitiState extends State<Choosequantitiy> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (count > 1) {
                        count--;
                      }
                    });
                  },
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  )),
              Text(count.toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: Text("+",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
