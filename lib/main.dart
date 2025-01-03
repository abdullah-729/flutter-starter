import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/task_repository.dart';
import 'package:flutter_application_1/data/services/task_service.dart';
import 'package:flutter_application_1/route/router.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_application_1/ui/core/themes/app_theme.dart';
import 'package:flutter_application_1/ui/task_list/view_model/task_list_view_model.dart';
import 'package:flutter_application_1/ui/task_form/view_model/task_form_view_model.dart';

void main() {
  final realmService = RealmService();
  final repository = TaskRepository(realmService.getRealmInstance());
  final taskListViewModel = TaskListViewModel(repository);
  final taskFormViewModel = TaskFormViewModel(repository);
  final appRouter = AppRouter(taskListViewModel, taskFormViewModel);

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: AppTheme.lightTheme,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.taskList,
    );
  }
}
