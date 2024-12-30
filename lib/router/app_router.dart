import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/features/Add%20Task/screens/add_task_screen.dart';
import 'package:task_management_app/features/Home/screens/home_screen.dart';
import 'package:task_management_app/model/task/task.dart';


part "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter{
  AppRouter(); 
  @override
  
  List<AutoRoute> get routes {

    return [
      AutoRoute(
        page: HomeRoute.page, 
        initial: true
      ), 
      AutoRoute(
        page: AddTaskRoute.page, 
      )
    ]; 
  }
}