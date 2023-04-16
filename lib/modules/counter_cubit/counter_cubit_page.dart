import 'dart:developer';

import 'package:bloc_aula/modules/counter_cubit/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocSelector<CounterCubit, CounterState, String>(
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
          BlocSelector<CounterCubit, CounterState, int>(
            selector: (state) => state.counter,
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
                  context.read<CounterCubit>().increment();
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                child: const Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().multiply(2);
                },
                child: const Text('Multiply 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().reset();
                },
                child: const Text('Reset'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
