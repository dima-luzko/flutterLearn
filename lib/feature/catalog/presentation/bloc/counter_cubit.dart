import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/counter.dart';

class CounterCubit extends Cubit<Counter> {
  CounterCubit() : super(Counter(0, 10));

  void increment() {
    if (state.count >= 0 && state.count < 10) {
      emit(Counter(state.count + 1, state.globalCount - 1));
    }
  }

  void decrement() {
    if (state.count > 0) {
      emit(Counter(state.count - 1, state.globalCount + 1));
    }
  }
}


