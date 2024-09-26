import 'package:flutter/material.dart';

import 'screens/todo_list_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: AppTheme.lightTheme,
      home: TodoListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
