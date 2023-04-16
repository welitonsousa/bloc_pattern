import 'package:bloc/bloc.dart';
import 'package:bloc_aula/modules/counter_bloc/bloc/counter_event.dart';
import 'package:bloc_aula/modules/counter_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEventIncrement>(_increment);
    on<CounterEventDecrement>(_decrement);
    on<CounterEventMultiply>(_multiply);
    on<CounterEventReset>(_reset);
  }

  void _increment(CounterEventIncrement event, Emitter emit) {
    emit(state.copyWith(counter: state.counter + 1, status: event.status));
  }

  void _decrement(CounterEventDecrement event, Emitter emit) {
    emit(state.copyWith(counter: state.counter - 1, status: event.status));
  }

  void _multiply(CounterEventMultiply event, Emitter emit) {
    emit(state.copyWith(
        counter: state.counter * event.value, status: event.status));
  }

  void _reset(CounterEventReset event, Emitter emit) {
    emit(CounterState.initial());
  }
}
