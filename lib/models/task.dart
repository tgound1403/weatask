class Task {
  String name;
  bool isDone;
  Task({required this.name, this.isDone = false});

  toggleDone() {
    isDone = !isDone;
  }

  setName(String name) {
    this.name = name;
  }
}
