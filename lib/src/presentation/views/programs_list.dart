import 'package:flutter/material.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import 'package:kodprov/src/presentation/views/programs_view_model.dart';

// TODO: Implement gestureDetection onTap to toggle favorite state of program.
// Tip use the GestureDetector(onTap:) or TextButton(onPressed:) widget.

class ProgramsListWidget extends StatefulWidget {
  final ProgramsViewModel viewModel;

  const ProgramsListWidget({required this.viewModel, Key? key}) : super(key: key);

  @override
  State<ProgramsListWidget> createState() => _ProgramsListWidgetState();
}

class _ProgramsListWidgetState extends State<ProgramsListWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Program>>(
        stream: widget.viewModel.programs,
        builder: (context, snapshot) {
          final programs = snapshot.data ?? [];
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final program = programs[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: widget.viewModel.isFavorite(program) ? Colors.green : Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(program.name, style: const TextStyle(color: Colors.white70)),
                    )),
              );
            },
          );
        });
  }
}
