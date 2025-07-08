import 'package:fl_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: StreamBuilder(
        stream: bloc.stream,
        builder: (ctx, snap) {
          return Center(child: Text("You have clicked ${snap.data} times"));
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            onPressed: () {
              bloc.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
