import 'package:injectable/injectable.dart';
import '/{{name.snakeCase()}}/domain/{{name.snakeCase()}}_provider.dart';
import '/{{name.snakeCase()}}/models/{{name.snakeCase()}}_model.dart';

@lazySingleton
class {{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}Repository(this._provider);

  final {{name.pascalCase()}}Provider _provider;

  Future<{{name.pascalCase()}}Model> getData(){
    return _provider.getData();
  }
}
