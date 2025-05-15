import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '/{{name.snakeCase()}}/models/{{name.snakeCase()}}_model.dart';

part '{{name.snakeCase()}}_service.g.dart';

@RestApi()
abstract class {{name.pascalCase()}}Service {
  factory {{name.pascalCase()}}Service(Dio dio, {String baseUrl}) = _{{name.pascalCase()}}Service;


  @GET('api/{{variable.dotCase()}}')
  Future<{{name.pascalCase()}}Model> getData();
}
