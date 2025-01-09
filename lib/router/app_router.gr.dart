// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:task_management_app/features/Add%20Task/screens/add_task_screen.dart'
    as _i1;
import 'package:task_management_app/features/Home/screens/home_screen.dart'
    as _i2;
import 'package:task_management_app/model/task/task.dart' as _i5;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddTaskRoute.name: (routeData) {
      final args = routeData.argsAs<AddTaskRouteArgs>(
          orElse: () => const AddTaskRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddTaskScreen(
          key: args.key,
          task: args.task,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTaskScreen]
class AddTaskRoute extends _i3.PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    _i4.Key? key,
    _i5.Task? task,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AddTaskRoute.name,
          args: AddTaskRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const _i3.PageInfo<AddTaskRouteArgs> page =
      _i3.PageInfo<AddTaskRouteArgs>(name);
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({
    this.key,
    this.task,
  });

  final _i4.Key? key;

  final _i5.Task? task;

  @override
  String toString() {
    return 'AddTaskRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
