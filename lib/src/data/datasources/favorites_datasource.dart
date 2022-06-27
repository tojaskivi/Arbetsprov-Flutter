import '../../domain/entities/program.dart';

abstract class FavoritesDataSource {
  Future<List<Program>> getFavorites();
}
