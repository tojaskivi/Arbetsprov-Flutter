import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/usecases/get_programs_usecase.dart';

class GetProgramsSortedAsFavorites {
  final GetPrograms _getPrograms;
  final FavoriteRepository _favoriteRepository;
  // final GetFavorites _favorites;

  GetProgramsSortedAsFavorites()
      : _getPrograms = GetIt.I<GetPrograms>(),
        _favoriteRepository = GetIt.I<FavoriteRepository>();
  // _favorites = GetIt.I<GetFavorites>();

  Future<List<Program>> call() async {
    // TODO: Fix sort-by-favorites
    // Favorite Programs first sorted in alphabetical order on prgoram.name
    // then the other programs sorted alphabetically.

    List<Program> programs = await _getPrograms();
    List<int> favorites = _favoriteRepository.favorites;

    programs.sort(
      (Program a, Program b) => a.name.compareTo(b.name),
    );

    List<Program> modifiedFavorites = [];

    for (var favorite in favorites) {
      modifiedFavorites.add(getProgram(favorite, programs));
    }

    modifiedFavorites.sort((Program a, Program b) => a.name.compareTo(b.name));

    programs.removeWhere((program) =>
        favorites.any((favorite) => favorite.toString() == program.id));

    return [...modifiedFavorites, ...programs];
  }

  Program getProgram(int id, List<Program> programs) {
    return programs.singleWhere((e) => id.toString() == e.id);
  }
}
