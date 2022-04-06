import 'package:kodprov/src/domain/entities/program.dart';

abstract class FavoriteRepository {
  bool isFavorite(Program program);
  void setFavorite(Program program);
  void removeFavorite(Program program);
}
