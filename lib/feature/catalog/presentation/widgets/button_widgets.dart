import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color background;
  final Color textColor;
  final Color remainderTextColor;
  final String count;
  final String remainder;

  const Button(
      {super.key,
        required this.background,
        required this.textColor,
        required this.remainderTextColor,
        required this.count,
        required this.remainder});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(left: 16, bottom: 16),
      decoration: ShapeDecoration(
          color: background,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(count,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('шт.',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(remainder,
                  style: TextStyle(color: remainderTextColor, fontSize: 16)))
        ],
      ),
    );
  }
}