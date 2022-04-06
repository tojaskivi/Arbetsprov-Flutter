import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/entities/program.dart';

class IsFavoriteProgram {
  final FavoriteRepository _favoritesRepository;

  IsFavoriteProgram() : _favoritesRepository = GetIt.I<FavoriteRepository>();

  bool call(Program program) {
    return _favoritesRepository.isFavorite(program);
  }
}
