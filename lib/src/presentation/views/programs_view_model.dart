import 'dart:async';

import 'package:get_it/get_it.dart';

import 'package:kodprov/src/domain/entities/program.dart';
import 'package:kodprov/src/domain/usecases/get_programs_sorted_as_favorites.dart';
import 'package:kodprov/src/domain/usecases/is_favorite_program_usecase.dart';
import 'package:kodprov/src/domain/usecases/remove_favorite_program_usecase.dart';
import 'package:kodprov/src/domain/usecases/set_favorite_program_usecase.dart';

class ProgramsViewModel {
  final GetProgramsSortedAsFavorites _getProgramsSortedAsFavorites;

  final SetFavoriteProgram _setFavoriteProgram;
  final RemoveFavoriteProgram _removeFavoriteProgram;
  final IsFavoriteProgram _isFavoriteProgram;

  late Stream<List<Program>> programs;

  final streamController = StreamController<List<Program>>();

  ProgramsViewModel()
      : _getProgramsSortedAsFavorites = GetIt.I<GetProgramsSortedAsFavorites>(),
        _isFavoriteProgram = GetIt.I<IsFavoriteProgram>(),
        _setFavoriteProgram = GetIt.I<SetFavoriteProgram>(),
        _removeFavoriteProgram = GetIt.I<RemoveFavoriteProgram>() {
    Future.microtask(() async => streamController.add(await _getProgramsSortedAsFavorites()));
    programs = streamController.stream;
  }

  void setAsFavorite(Program program) {
    _setFavoriteProgram(program);
  }

  void removeAsFavorite(Program program) {
    _removeFavoriteProgram(program);
  }

  Future<void> updatePrograms() async {
    streamController.add(await _getProgramsSortedAsFavorites());
  }

  void toggleFavorite(Program program) async {
    if (_isFavoriteProgram(program)) {
      _removeFavoriteProgram(program);
    } else {
      _setFavoriteProgram(program);
    }
    await updatePrograms();
    return;
  }

  bool isFavorite(Program program) {
    return _isFavoriteProgram(program);
  }
}
