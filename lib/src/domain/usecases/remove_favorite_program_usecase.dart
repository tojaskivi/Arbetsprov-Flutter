import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/entities/program.dart';

class RemoveFavoriteProgram {
  final FavoriteRepository _favoritesRepository;

  RemoveFavoriteProgram()
      : _favoritesRepository = GetIt.I<FavoriteRepository>();

  void call(Program program) {
    print("Now I am over here!");
    _favoritesRepository.removeFavorite(program);
  }
}
