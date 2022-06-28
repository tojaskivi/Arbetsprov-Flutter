import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import 'package:kodprov/src/domain/repositories/favorites_repository.dart';
import 'package:kodprov/src/domain/repositories/programs_repository.dart';
import 'package:kodprov/src/domain/usecases/get_programs_sorted_as_favorites.dart';
import 'package:kodprov/src/domain/usecases/get_programs_usecase.dart';
import 'package:kodprov/src/domain/usecases/is_favorite_program_usecase.dart';

class MockProgramsReposistory extends ProgramsRepository {
  @override
  Future<List<Program>> getPrograms() async {
    return [
      Program(id: "1", name: "aaa"),
      Program(id: "2", name: "ccc"),
      Program(id: "3", name: "bbb"),
      Program(id: "4", name: "bbb"),
      Program(id: "5", name: "ccc"),
      Program(id: "6", name: "aaa"),
    ];
  }
}

class MockIsFavoriteRepository extends FavoriteRepository {
  final favorites = [2, 4, 6];

  @override
  bool isFavorite(Program program) {
    return favorites.contains(int.parse(program.id));
  }

  @override
  void removeFavorite(Program program) {
    // ignore
  }

  @override
  void setFavorite(Program program) {
    // ignore
  }
}

void main() {
  test('Test correct sort order of getProgramsSortedAsFavorites useCase',
      () async {
    final injector = GetIt.instance;
    injector
      ..registerLazySingleton<ProgramsRepository>(
          () => MockProgramsReposistory())
      ..registerLazySingleton<FavoriteRepository>(
          () => MockIsFavoriteRepository())
      ..registerLazySingleton<GetPrograms>(() => GetPrograms())
      ..registerLazySingleton<IsFavoriteProgram>(() => IsFavoriteProgram());

    final getProgramsSortedAsFavorites = GetProgramsSortedAsFavorites();

    final sortedPrograms = await getProgramsSortedAsFavorites();

    expect(sortedPrograms.map((p) => p.id), ["6", "4", "2", "1", "3", "5"]);
  });
}
