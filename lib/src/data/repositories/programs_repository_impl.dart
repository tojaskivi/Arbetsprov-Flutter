import 'package:get_it/get_it.dart';
import 'package:kodprov/src/data/datasources/programs_datasource.dart';
import 'package:kodprov/src/domain/entities/program.dart';
import 'package:kodprov/src/domain/repositories/programs_repository.dart';

class ProgramsRepositoryImpl extends ProgramsRepository {
  final ProgramsDataSource _programsDataSource;

  ProgramsRepositoryImpl() : _programsDataSource = GetIt.I<ProgramsDataSource>();

  @override
  Future<List<Program>> getPrograms() async {
    return _programsDataSource.getPrograms().then((list) => list.map((programModel) => programModel.toDomainEntity()).toList());
  }
}
