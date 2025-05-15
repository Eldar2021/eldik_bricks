import 'package:injectable/injectable.dart';
import '/{{name.snakeCase()}}/data/{{name.snakeCase()}}_service.dart';
import '/{{name.snakeCase()}}/domain/{{name.snakeCase()}}_provider.dart';
import '/{{name.snakeCase()}}/models/{{name.snakeCase()}}_model.dart';

@LazySingleton(as: {{name.pascalCase()}}Provider)
class Remote{{name.pascalCase()}}Provider extends {{name.pascalCase()}}Provider {
  Remote{{name.pascalCase()}}Provider(this._service);

  final {{name.pascalCase()}}Service _service;

  Future<{{name.pascalCase()}}Model> getData(){
    return _service.getData();
  }
}
