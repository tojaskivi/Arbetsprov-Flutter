import '../../domain/entities/program.dart';

abstract class FavoritesDataSource {
  List<int> getFavorites();
  bool isFavorite(Program program);
  void setFavorite(Program program);
  void removeFavorite(Program program);
}
