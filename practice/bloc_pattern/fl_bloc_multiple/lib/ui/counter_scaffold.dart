import 'package:fl_bloc_multiple/bloc/bloc_provider.dart';
import 'package:fl_bloc_multiple/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterScaffold extends StatelessWidget {
  const CounterScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: StreamBuilder(
        stream: bloc?.stream,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("You have clicked ${snapshot.data} times")],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc?.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            onPressed: () {
              bloc?.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
