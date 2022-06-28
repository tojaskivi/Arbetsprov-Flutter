import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import '../datasources/favorites_datasource.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoritesDataSource _favoritesDataSource;

  FavoriteRepositoryImpl()
      : _favoritesDataSource = GetIt.I<FavoritesDataSource>();

  @override
  Future<List<int>> getFavorites() async {
    return _favoritesDataSource.getFavorites();
  }

  @override
  bool isFavorite(Program program) {
    return _favoritesDataSource.isFavorite(program);
  }

  @override
  void removeFavorite(Program program) {
    _favoritesDataSource.removeFavorite(program);
  }

  @override
  void setFavorite(Program program) {
    _favoritesDataSource.setFavorite(program);
  }

  @override
  List<int> get favorites => _favoritesDataSource.getFavorites();
}
