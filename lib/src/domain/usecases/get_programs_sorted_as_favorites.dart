import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import 'package:kodprov/src/domain/usecases/get_programs_usecase.dart';

class GetProgramsSortedAsFavorites {
  final GetPrograms _getPrograms;

  GetProgramsSortedAsFavorites() : _getPrograms = GetIt.I<GetPrograms>();

  Future<List<Program>> call() async {
    // TODO: Fix sort-by-favorites
    // Favorite Programs first sorted in alphabetical order on prgoram.name
    // then the other programs sorted alphabetically.
    return _getPrograms();
  }
}
