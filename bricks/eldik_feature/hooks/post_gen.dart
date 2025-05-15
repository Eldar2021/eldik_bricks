import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final currentPath = Directory.current.path;
  final workingDirectory = '$currentPath/${context.vars['name']}';
  await _runDartFormat(context, workingDirectory);
  await _runDartFix(context, workingDirectory);
  await _generateRetroFit(context, workingDirectory);
}

Future<void> _runDartFormat(HookContext context, String path) async {
  final formatProgress = context.logger.progress('Running "dart format ."');
  await Process.run(
    'dart',
    ['format', '.'],
    workingDirectory: path,
  );
  formatProgress.complete();
}

Future<void> _runDartFix(HookContext context, String path) async {
  final formatProgress = context.logger.progress('Running "dart fix --apply"');
  await Process.run(
    'dart',
    ['fix', '--apply'],
    workingDirectory: path,
  );
  formatProgress.complete();
}

Future<void> _generateRetroFit(HookContext context, String path) async {
  final formatProgress = context.logger.progress(
    'Running "flutter pub run build_runner build --delete-conflicting-outputs"',
  );
  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    workingDirectory: path,
  );
  formatProgress.complete();
}
