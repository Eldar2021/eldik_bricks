import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/{{name.snakeCase()}}/models/{{name.snakeCase()}}_model.dart';
import '/{{name.snakeCase()}}/domain/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_bloc.freezed.dart';
part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  final {{name.pascalCase()}}Repository _repository;

  {{name.pascalCase()}}Bloc(this._repository) : super(const {{name.pascalCase()}}State.initial()) {
    on<{{name.pascalCase()}}Event>(
      (event, emit) => event.when(
        getData: () async {
          try {
            emit(const {{name.pascalCase()}}State.loading());

            final data = await _repository.getData();

            return emit({{name.pascalCase()}}State.success(data));
          } catch (e) {
            return emit({{name.pascalCase()}}State.failure(e));
          }
        },
      ),
    );
  }
}
