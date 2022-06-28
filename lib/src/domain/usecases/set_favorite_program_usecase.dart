import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/entities/program.dart';

class SetFavoriteProgram {
  final FavoriteRepository _favoritesRepository;

  SetFavoriteProgram() : _favoritesRepository = GetIt.I<FavoriteRepository>();

  void call(Program program) {
    print("Second step");
    print(program.id);
    _favoritesRepository.setFavorite(program);
  }
}
