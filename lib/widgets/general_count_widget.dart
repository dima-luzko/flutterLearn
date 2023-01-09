import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit.dart';

class GeneralCount extends StatelessWidget {
  const GeneralCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, Counters>(
        builder: (context, count) => Text(
              '${count.globalCount} шт.',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ));
  }
}
