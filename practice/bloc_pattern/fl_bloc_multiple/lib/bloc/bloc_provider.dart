import 'package:flutter/material.dart';

import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;
  const BlocProvider({super.key, required this.bloc, required this.child});

  @override
  State<BlocProvider> createState() => _BlocProviderState();

  static T? of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T>? provider = context
        .findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider?.bloc;
  }
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
