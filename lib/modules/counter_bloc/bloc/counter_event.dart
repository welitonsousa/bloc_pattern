import 'counter_state.dart';

class CounterEvent {}

class CounterEventIncrement extends CounterEvent {
  CounterStatus get status => CounterStatus.increment;
}

class CounterEventReset extends CounterEvent {
  CounterStatus get status => CounterStatus.reset;
}

class CounterEventDecrement extends CounterEvent {
  CounterStatus get status => CounterStatus.decrement;
}

class CounterEventMultiply extends CounterEvent {
  final int value;
  CounterEventMultiply(this.value);

  CounterStatus get status => CounterStatus.multiply;
}
