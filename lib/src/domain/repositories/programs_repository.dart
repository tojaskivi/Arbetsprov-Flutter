import 'package:kodprov/src/domain/entities/program.dart';

abstract class ProgramsRepository {
  Future<List<Program>> getPrograms();
}
