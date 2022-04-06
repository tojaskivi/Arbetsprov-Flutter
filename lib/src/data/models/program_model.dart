import 'package:equatable/equatable.dart';
import 'package:kodprov/src/domain/entities/program.dart';

class ProgramModel extends Equatable {
  final String description;
  final String name;
  final int id;

  const ProgramModel({
    required this.id,
    required this.name,
    required this.description,
  });

  static ProgramModel fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
      );

  @override
  List<Object?> get props => [id, name, description];

  @override
  String toString() {
    return "$id: $name - $description";
  }

  Program toDomainEntity() {
    return Program(id: id.toString(), name: name);
  }
}
