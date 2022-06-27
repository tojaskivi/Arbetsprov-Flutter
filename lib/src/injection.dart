import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/usecases/get_programs_sorted_as_favorites.dart';
import 'data/datasources/programs_datasource.dart';
import 'domain/repositories/favorites_repository.dart';
import 'data/repositories/favorites_repository_impl.dart';
import 'data/repositories/programs_repository_impl.dart';
import 'domain/repositories/programs_repository.dart';
import 'data/datasources/remote_programs_datasource.dart';
import 'domain/usecases/is_favorite_program_usecase.dart';
import 'domain/usecases/remove_favorite_program_usecase.dart';
import 'domain/usecases/set_favorite_program_usecase.dart';
import 'domain/usecases/get_programs_usecase.dart';

final serviceLocator = GetIt.instance;
void setupDependencies() async {
  // Repositories
  serviceLocator
    ..registerLazySingleton<ProgramsRepository>(() => ProgramsRepositoryImpl())
    ..registerLazySingleton<ProgramsDataSource>(
        () => RemoteProgramsDataSource())
    ..registerLazySingleton<GetPrograms>(() => GetPrograms())
    ..registerLazySingleton<FavoriteRepository>(() => FavoriteRepositoryImpl())
    ..registerLazySingleton<SetFavoriteProgram>(() => SetFavoriteProgram())
    ..registerLazySingleton<IsFavoriteProgram>(() => IsFavoriteProgram())
    ..registerLazySingleton<RemoveFavoriteProgram>(
        () => RemoveFavoriteProgram())
    ..registerLazySingleton<GetProgramsSortedAsFavorites>(
        () => GetProgramsSortedAsFavorites());
}
