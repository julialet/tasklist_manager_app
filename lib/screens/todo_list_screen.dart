import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [];

  final TextEditingController taskController = TextEditingController();
  final date = DateTime.now();

  void _addTask(String taskTitle) {
    setState(() {
      tasks.add(Task(title: taskTitle, status: 'Em Progresso'));
    });
    taskController.clear();
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      tasks[index].toggleStatus();
    });
  }

  void _showAddTaskDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Adicionar Tarefa',
          style: TextStyle(color: Color(0xFF149c68)), // Cor do título
        ),
        content: TextField(
          controller: taskController,
          decoration: InputDecoration(
            hintText: 'Digite o nome da tarefa',
            hintStyle: TextStyle(color: Color(0xFF38393)), // Cor do texto de dica
          ),
          style: TextStyle(color: Color(0xFF383939)), // Cor do texto no TextField
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF149c68), // Cor do texto do botão "Cancelar"
            ),
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color(0xFF149c68), // Cor do texto do botão "Adicionar"
            ),
            child: Text('Adicionar'),
            onPressed: () {
              _addTask(taskController.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(100.0), // Defina a altura desejada
      child: AppBar(
        title:
        Column(children: <Widget>[
          Text(
          'Olá, Júlia',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(date.toString(), style: TextStyle(color: Colors.white),)
        ]),
        centerTitle: true, // Centraliza o título
        backgroundColor: Color(0xFF149c68), // Cor do fundo da AppBar
      ),
    ),
    body: ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index],
          onStatusChange: () => _toggleTaskStatus(index),
          onDelete: () => _removeTask(index),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _showAddTaskDialog,
      backgroundColor: Color(0xFF149c68), // Cor de fundo do FloatingActionButton
      child: Icon(
        Icons.add,
        color: Colors.white, // Cor do ícone (símbolo +)
      ),
    ),
  );
}
}
