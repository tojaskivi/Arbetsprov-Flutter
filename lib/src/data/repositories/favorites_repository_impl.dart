import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/entities/program.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  FavoriteRepositoryImpl();

  final List<Program> _favourites = [];
  @override
  List<Program> get favorites => _favourites;

  @override
  bool isFavorite(Program program) {
    return favorites.any((favorites) => favorites.id == program.id);
  }

  @override
  void setFavorite(Program program) {
    favorites.add(program);
  }

  @override
  void removeFavorite(Program program) {
    favorites.removeWhere((favorite) => favorite.id == program.id);
  }

  List<Program> getFavorites() {
    return favorites;
  }
}
