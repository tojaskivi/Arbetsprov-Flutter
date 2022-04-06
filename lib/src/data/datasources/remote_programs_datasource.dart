import 'dart:convert';

import 'package:kodprov/src/data/datasources/programs_datasource.dart';
import 'package:kodprov/src/data/models/program_model.dart';

import 'package:http/http.dart' as http;

class RemoteProgramsDataSource extends ProgramsDataSource {
  static const endpoint = "https://api.sr.se/api/v2/programs/index?channelid=164&pagination=false&format=json";

  @override
  Future<List<ProgramModel>> getPrograms() async {
    final url = Uri.parse(endpoint);

    final response = await http.get(url);

    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    final list = decodedResponse['programs'] as List<dynamic>;

    final programModels = list.map((json) => ProgramModel.fromJson(json)).toList();

    return programModels;
  }
}
