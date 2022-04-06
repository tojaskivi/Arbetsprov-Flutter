import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kodprov/src/data/models/program_model.dart';

void main() {
  test('Program Model decode', () async {
    final file = File('test_resources/test_model.json');
    final string = await file.readAsString();
    final data = json.decode(string);
    final program = ProgramModel.fromJson(data);
    expect(program.id, 1123);
    expect(program.name, "Hej Domstol");
    expect(program.description, "Sändes 2006-2007. Vi tar upp ditt mejlade åtal. Vi utreder, argumenterar och dömer - allt efter tycke och smak.");
  });
}
