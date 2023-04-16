import 'package:bloc_aula/modules/counter_bloc/bloc/counter_bloc.dart';
import 'package:bloc_aula/modules/counter_bloc/counter_bloc_page.dart';
import 'package:bloc_aula/modules/counter_cubit/counter_cubit_page.dart';
import 'package:bloc_aula/modules/counter_cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pages {
  final initial = '/home/cubit';

  Map<String, Widget Function(BuildContext)> routes = {
    '/home/bloc': (_) => BlocProvider(
          create: (_) => CounterBloc(),
          child: const CounterBlocPage(),
        ),
    '/home/cubit': (_) => BlocProvider(
          create: (_) => CounterCubit(),
          child: const CounterCubitPage(),
        ),
  };
}
