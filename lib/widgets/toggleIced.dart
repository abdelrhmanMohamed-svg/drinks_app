import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}



class _CustomContainerState extends State<CustomContainer> {
  bool isIced = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.shade300),
      child: Row(
        children: [
                  buildToggleSelection("Iced",isIced),
                  buildToggleSelection("Hot",!isIced),

        ],
      ),
    );
  }

  Widget buildToggleSelection(label, selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isIced = label == "Iced";
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 17),
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: selected ? Colors.white : Colors.grey.shade300),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(label,style: TextStyle(fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }
}
