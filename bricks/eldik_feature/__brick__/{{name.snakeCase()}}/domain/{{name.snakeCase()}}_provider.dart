import '/{{name.snakeCase()}}/models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}Provider {
  Future<{{name.pascalCase()}}Model> getData();
}
