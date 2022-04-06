import 'package:flutter/material.dart';
import 'package:kodprov/src/injection.dart';
import 'package:kodprov/src/presentation/views/programs_list.dart';
import 'package:kodprov/src/presentation/views/programs_view_model.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodprov',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Program i P3'),
        ),
        body: SafeArea(
          child: Center(
            child: ProgramsListWidget(viewModel: ProgramsViewModel()),
          ),
        ),
      ),
    );
  }
}
