import 'package:kodprov/src/data/models/program_model.dart';

abstract class ProgramsDataSource {
  Future<List<ProgramModel>> getPrograms();
}
