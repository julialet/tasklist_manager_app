import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onStatusChange;
  final VoidCallback onDelete;

  TaskCard({required this.task, required this.onStatusChange, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: task.status == 'Concluída' ? Colors.green[300] : Colors.grey[800],
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          task.status,
          style: TextStyle(color: Colors.white70),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(task.status == 'Concluída' ? Icons.undo : Icons.check, color: Colors.white),
              onPressed: onStatusChange,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
