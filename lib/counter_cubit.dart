import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<Counters> {
  CounterCubit() : super(Counters(0, 10));

  void increment() {
    if (state.count >= 0 && state.count < 10) {
      emit(Counters(state.count + 1, state.globalCount - 1));
    }
  }

  void decrement() {
    if (state.count > 0) {
      emit(Counters(state.count - 1, state.globalCount + 1));
    }
  }
}

class Counters {
  int count;
  int globalCount;

  Counters(this.count, this.globalCount);
}
