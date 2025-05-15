import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_model.g.dart';

@JsonSerializable()
class {{name.pascalCase()}}Model {
  const {{name.pascalCase()}}Model({
    required this.id, 
    required this.name,
  });

  final String? id;
  final String? name;

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}ModelFromJson(json);

  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ModelToJson(this);
}
