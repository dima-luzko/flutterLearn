import 'package:flutter/cupertino.dart';
import 'count_state_widget.dart';

class GeneralCount extends StatelessWidget {
  const GeneralCount({super.key});

  @override
  Widget build(BuildContext context) {
    final counterState = CountState.of(context);
    return Text(
      '${counterState.global} шт.',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }
}