import 'package:bloc/bloc.dart';
import 'package:bloc_aula/modules/counter_cubit/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(state.copyWith(
        counter: state.counter + 1, status: CounterStatus.increment));
  }

  void decrement() {
    emit(state.copyWith(
        counter: state.counter - 1, status: CounterStatus.decrement));
  }

  void multiply(int value) {
    emit(state.copyWith(
        counter: state.counter * value, status: CounterStatus.multiply));
  }

  void reset() {
    emit(CounterState.initial());
  }
}
