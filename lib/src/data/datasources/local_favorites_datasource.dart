import 'package:kodprov/src/data/datasources/favorites_datasource.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalFavoritesDataSource extends FavoritesDataSource {
  List<int> _favorites = [];
  late SharedPreferences preferences;
  @override
  List<int> getFavorites() {
    return _favorites;
  }

  LocalFavoritesDataSource() {
    _loadFromStorage();
  }

  getSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  bool isFavorite(Program program) {
    return getFavorites().contains(int.parse(program.id));
  }

  @override
  void removeFavorite(Program program) {
    _favorites.remove(int.parse(program.id));
    _saveToStorage();
  }

  @override
  void setFavorite(Program program) {
    _favorites.add(int.parse(program.id));
    _saveToStorage();
  }

  void _loadFromStorage() async {
    await getSharedPreferences();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    dynamic fromStorage = preferences.getString('favorites');
    if (fromStorage == null) {
      _favorites = [];
    } else {
      fromStorage = jsonDecode(fromStorage);
      _favorites = [...fromStorage];
    }
  }

  void _saveToStorage() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();

    var encoded = jsonEncode(_favorites);

    await preferences.setString('favorites', encoded);
  }
}
