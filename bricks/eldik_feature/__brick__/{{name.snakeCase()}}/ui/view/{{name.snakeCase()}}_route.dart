import 'package:core/router/helper.dart';
import 'package:core/router/navigation_state.dart';
import 'package:core/router/route_data.dart';
import 'package:core/ui/builders/platform_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '/{{name.snakeCase()}}/domain/{{name.snakeCase()}}_repository.dart';
import '/{{name.snakeCase()}}/ui/bloc/{{name.snakeCase()}}_bloc.dart';
import '/{{name.snakeCase()}}/ui/view/{{name.snakeCase()}}_view.dart';

const _kPath = '/{{name.paramCase()}}';
const _kName = '{{name.paramCase()}}';

class {{name.pascalCase()}}Route extends AppRouteData with AppRouteActions {
  const {{name.pascalCase()}}Route() : super(_path);

  @override
  ScreenExtra? get extra => null;

  static const _path = _kPath;

  static {{name.pascalCase()}}Route _fromState(GoRouterState state) => const {{name.pascalCase()}}Route();

  static final route = AppRouteData.route<{{name.pascalCase()}}Route>(
    path: _path,
    factory: _fromState,
    parentNavigatorKey: rootNavigatorKey,
    name: _kName,
  );

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return PlatformPageBuilder(
      arguments: RouteHelper.setArguments(analyticsName: _kName),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<{{name.pascalCase()}}Bloc>(
            create: (context) => {{name.pascalCase()}}Bloc(GetIt.I<{{name.pascalCase()}}Repository>()),
          ),
        ],
        child: const {{name.pascalCase()}}View(),
      ),
    ).build();
  }
}
