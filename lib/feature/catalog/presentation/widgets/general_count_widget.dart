import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/feature/catalog/domain/entity/counter.dart';

import '../../../catalog/presentation/bloc/counter_cubit.dart';


class GeneralCountWidget extends StatelessWidget {
  const GeneralCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, Counter>(
        builder: (context, count) => Text(
              '${count.globalCount} шт.',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ));
  }
}
