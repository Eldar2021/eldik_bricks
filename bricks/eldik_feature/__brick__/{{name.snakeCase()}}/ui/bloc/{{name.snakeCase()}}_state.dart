part of '{{name.snakeCase()}}_bloc.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const {{name.pascalCase()}}State._();

  const factory {{name.pascalCase()}}State.initial() = Initial{{name.pascalCase()}}State;

  const factory {{name.pascalCase()}}State.loading() = Loading{{name.pascalCase()}}State;

  const factory {{name.pascalCase()}}State.success({{name.pascalCase()}}Model data) = Success{{name.pascalCase()}}State;

  const factory {{name.pascalCase()}}State.failure(dynamic exception) = Failure{{name.pascalCase()}}State;

  bool get isLoading => this is Loading{{name.pascalCase()}}State;
}
