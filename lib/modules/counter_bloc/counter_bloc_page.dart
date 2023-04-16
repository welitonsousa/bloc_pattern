import 'dart:developer';

import 'package:bloc_aula/modules/counter_bloc/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocSelector<CounterBloc, CounterState, String>(
            selector: (state) => state.message,
            builder: (a, message) {
              log('rebuild message');
              return Center(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              );
            },
          ),
          BlocSelector<CounterBloc, CounterState, int>(
            selector: (counter) => bloc.state.counter,
            builder: (a, counter) => Center(
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Wrap(
            spacing: 5,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterEventIncrement());
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterEventDecrement());
                },
                child: const Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterEventMultiply(2));
                },
                child: const Text('Multiply 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterEventReset());
                },
                child: const Text('reset'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
