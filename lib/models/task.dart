class Task {
  String title;
  String status;

  Task({required this.title, required this.status});

  void toggleStatus() {
    status = status == 'Em Progresso' ? 'Concluída' : 'Em Progresso';
  }
}
