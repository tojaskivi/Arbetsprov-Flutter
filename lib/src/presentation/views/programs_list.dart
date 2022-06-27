import 'package:flutter/material.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import 'package:kodprov/src/domain/usecases/set_favorite_program_usecase.dart';
import 'package:kodprov/src/presentation/views/programs_view_model.dart';

// TODO: Implement gestureDetection onTap to toggle favorite state of program.
// Tip use the GestureDetector(onTap:) or TextButton(onPressed:) widget.

class ProgramsListWidget extends StatefulWidget {
  final ProgramsViewModel viewModel;

  const ProgramsListWidget({required this.viewModel, Key? key})
      : super(key: key);

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
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                onLongPress: () => widget.viewModel.play(program),
                onTap: () => widget.viewModel.goToProgram(program),
                tileColor: widget.viewModel.isFavorite(program)
                    ? Colors.blueGrey[800]
                    : Colors.blueGrey[900],
                shape: const Border(
                  bottom: BorderSide(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => widget.viewModel.toggleFavorite(program),
                  icon: widget.viewModel.isFavorite(program)
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red[900],
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                  iconSize: 28,
                ),
                title: Text(
                  program.name,
                  style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              );
            },
          );
        });
  }
}
