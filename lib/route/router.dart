import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/task_form/view_model/task_form_view_model.dart';
import 'package:flutter_application_1/ui/task_form/widgets/task_form_view.dart';
import 'package:flutter_application_1/ui/task_list/view_model/task_list_view_model.dart';
import 'package:flutter_application_1/ui/task_list/widgets/task_list_view.dart';

import 'routes.dart';

class AppRouter {
  final TaskListViewModel taskListViewModel;
  final TaskFormViewModel taskFormViewModel;

  AppRouter(this.taskListViewModel, this.taskFormViewModel);

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.taskList:
        return MaterialPageRoute(
            builder: (_) => TaskListView(viewModel: taskListViewModel));
      case Routes.taskForm:
        return MaterialPageRoute(
            builder: (_) => TaskFormView(viewModel: taskFormViewModel));
      default:
        return MaterialPageRoute(
            builder: (_) => TaskListView(viewModel: taskListViewModel));
    }
  }
}
