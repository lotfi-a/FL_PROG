import 'package:fl_bloc_multiple/bloc/bloc_provider.dart';
import 'package:fl_bloc_multiple/bloc/counter_bloc.dart';
import 'package:fl_bloc_multiple/bloc/text_bloc.dart';
import 'package:fl_bloc_multiple/ui/counter_scaffold.dart';
import 'package:fl_bloc_multiple/ui/text_scaffold.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Scaffold")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      bloc: CounterBloc(),
                      child: CounterScaffold(),
                    );
                  },
                );
                Navigator.of(context).push(route);
              },
              child: Text("Counter"),
            ),
            FilledButton(
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      bloc: TextBloc(),
                      child: TextScaffold(),
                    );
                  },
                );
                Navigator.of(context).push(route);
              },
              child: Text("Text"),
            ),
          ],
        ),
      ),
    );
  }
}
