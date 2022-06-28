import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/entities/program.dart';

class GetFavorites {
  final FavoriteRepository _favoriteRepository;

  GetFavorites() : _favoriteRepository = GetIt.I<FavoriteRepository>();

  List<int> call() {
    return _favoriteRepository.favorites;
  }
}
