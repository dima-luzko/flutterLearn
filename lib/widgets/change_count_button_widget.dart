import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'count_state_widget.dart';

class ButtonSection extends StatefulWidget {
  const ButtonSection({super.key});

  @override
  State<ButtonSection> createState() => _ButtonSection();
}

class _ButtonSection extends State<ButtonSection> {
  @override
  Widget build(BuildContext context) {
    final counterState = CountState.of(context);
    return Column(
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(minusButtonColor),
                  ),
                  onPressed: counterState.decrementer,
                  child: const Icon(Icons.remove, color: minusButtonIconColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                '${counterState?.count}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(plusButtonColor),
                  ),
                  onPressed: counterState.incrementer,
                  child: const Icon(Icons.add)),
            ),
          ],
        ),
      ],
    );
  }
}
