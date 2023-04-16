enum CounterStatus { increment, decrement, reset, multiply }

class CounterState {
  final int counter;
  final String message;
  final CounterStatus status;
  CounterState({
    required this.counter,
    required this.message,
    required this.status,
  });

  factory CounterState.initial() => CounterState(
        counter: 0,
        message: 'Bloc Counter',
        status: CounterStatus.reset,
      );

  CounterState copyWith({
    int? counter,
    String? message,
    CounterStatus? status,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
