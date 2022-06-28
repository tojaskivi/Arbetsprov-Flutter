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
              return Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.viewModel.isFavorite(program)
                      ? Color(0xFF7445f7)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: widget.viewModel.isFavorite(program)
                          ? Colors.green
                          : Colors.deepPurple,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  onLongPress: () => widget.viewModel.play(program),
                  onTap: () => Navigator.pushNamed(
                    context,
                    ProgramPage.routeName,
                    arguments: {"id": program.id, "name": program.name},
                  ),
                  // tileColor: widget.viewModel.isFavorite(program)
                  //     ? Colors.green
                  //     : Colors.white,
                  trailing: IconButton(
                    onPressed: () => widget.viewModel.toggleFavorite(program),
                    icon: widget.viewModel.isFavorite(program)
                        ? Icon(
                            Icons.favorite,
                            color: Color(0xFFF77445),
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Color(0xFFF77445),
                          ),
                    iconSize: 28,
                  ),
                  title: Text(
                    program.name,
                    style: TextStyle(
                        color: widget.viewModel.isFavorite(program)
                            ? Colors.white
                            : Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              );
            },
          );
        });
  }
}

class ProgramPage extends StatelessWidget {
  const ProgramPage() : super();

  static const routeName = '/single';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(args['name']!),
          ],
        ),
      ),
    );
  }
}
