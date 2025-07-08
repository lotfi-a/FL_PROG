import 'package:fl_bloc_multiple/bloc/bloc_provider.dart';
import 'package:fl_bloc_multiple/bloc/text_bloc.dart';
import 'package:flutter/material.dart';

class TextScaffold extends StatelessWidget {
  TextScaffold({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TextBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Text")),
      body: StreamBuilder(
        stream: bloc?.stream,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: controller,
                onChanged: (String? value) {
                  if (value != null) {
                    bloc?.mutate(value);
                  }
                },
              ),
              Text(
                snapshot.data!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          );
        },
      ),
    );
  }
}
