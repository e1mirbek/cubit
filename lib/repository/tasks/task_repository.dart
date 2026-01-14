import 'package:cubit_example/data/models/tasks/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
}

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<List<Task>> getTasks() async {
    await Future.delayed(Duration(seconds: 5));

    return [
      Task(id: 1, title: 'Купить гибкий мрамор'),
      Task(id: 2, title: 'Купить декоративный панель'),
      Task(id: 3, title: 'Купить плитку мраморный'),
      Task(id: 4, title: 'Купить пеноплекс 3ка Экодом'),
      Task(id: 5, title: 'Купуить потолочный пластик'),
    ];
  }
}
