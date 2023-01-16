import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/presentation/bloc/catalog/counter_cubit.dart';

import '../../common/app_colors.dart';

class ButtonSection extends StatefulWidget {
  const ButtonSection({super.key});

  @override
  State<ButtonSection> createState() => _ButtonSection();
}

class _ButtonSection extends State<ButtonSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<CounterCubit, Counters>(
            builder: (context, counts) => Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                minusButtonColor),
                          ),
                          onPressed: () =>
                              context.read<CounterCubit>().decrement(),
                          child: const Icon(Icons.remove,
                              color: minusButtonIconColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        '${counts.count}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                plusButtonColor),
                          ),
                          onPressed: () =>
                              context.read<CounterCubit>().increment(),
                          child: const Icon(Icons.add)),
                    ),
                  ],
                ))
      ],
    );
  }
}
