import 'package:kodprov/src/domain/entities/program.dart';

abstract class FavoriteRepository {
  List<int> get favorites;
  bool isFavorite(Program program);
  void setFavorite(Program program);
  void removeFavorite(Program program);
}
