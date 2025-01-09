import 'package:auto_route/auto_route.dart';
import 'package:task_management_app/router/app_router.gr.dart';



@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter{
  @override
  
  List<AutoRoute> get routes {

    return [
      CustomRoute(
        page: HomeRoute.page, 
        initial: true
      ), 
      CustomRoute(
        page: AddTaskRoute.page, 
      )
    ]; 
  }
}