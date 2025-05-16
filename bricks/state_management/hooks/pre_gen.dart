import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

enum BlocType {
  bloc,
  cubit;

  String getGitPath() {
    return switch (this) {
      BlocType.bloc => 'bricks/bloc',
      BlocType.cubit => 'bricks/cubit',
    };
  }

  String toDirectoryName() {
    return switch (this) {
      BlocType.bloc => 'bloc',
      BlocType.cubit => 'cubit',
    };
  }
}

Future<void> run(HookContext context) async {
  final blocType = _blocTypeFromContext(context);
  final progress = context.logger.progress('Making brick ${blocType.name}');
  final name = context.vars['name'] as String;
  final style = context.vars['style'] as String;
  print('blocType: $blocType');
  print('name: $name');
  print('style: $style');
  final brick = Brick.git(GitPath("https://github.com/Eldar2021/eldik_bricks.git", path: blocType.getGitPath()));
  print('brick: ${brick.location.path}');
  print('brick location: ${brick.location.path}');
  // print('brick location: ${brick.location.}');
  final generator = await MasonGenerator.fromBrick(brick);
  print('generator: ${generator.description}');
  final blocDirectoryName = blocType.toDirectoryName();
  final directory = Directory(path.join(Directory.current.path, name.snakeCase, blocDirectoryName));
  final target = DirectoryGeneratorTarget(directory);
  var vars = <String, dynamic>{'name': name, 'style': style};
  await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
  await generator.generate(
    target,
    vars: vars,
    logger: context.logger,
    fileConflictResolution: FileConflictResolution.overwrite,
  );
  await generator.hooks.postGen(vars: vars);
  final blocExport = './$blocDirectoryName/${name.snakeCase}_$blocDirectoryName.dart';
  progress.complete('Made brick ${blocType.name}');
  context.vars = {...context.vars, 'bloc_export': blocExport, 'is_bloc': blocDirectoryName == 'bloc'};
}

BlocType _blocTypeFromContext(HookContext context) {
  final type = context.vars['type'] as String;
  return switch (type) {
    'cubit' => BlocType.cubit,
    'bloc' => BlocType.bloc,
    _ => BlocType.bloc,
  };
}
