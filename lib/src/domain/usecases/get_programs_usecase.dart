import 'package:get_it/get_it.dart';
import 'package:kodprov/src/domain/repositories/programs_repository.dart';
import 'package:kodprov/src/domain/entities/program.dart';

class GetPrograms {
  final ProgramsRepository _programsRepository;

  GetPrograms() : _programsRepository = GetIt.I<ProgramsRepository>();

  Future<List<Program>> call() {
    return _programsRepository.getPrograms();
  }
}
