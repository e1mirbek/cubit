import 'package:cubit_example/controller/tasks/task_state.dart';
import 'package:cubit_example/repository/tasks/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/tasks/task.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository _taskRepository;
  TaskCubit(this._taskRepository) : super(TaskInitial());

  void toggleTask(Task task) {
    if (state is! TaskSuccess) return;

    final tasks = List<Task>.from((state as TaskSuccess).tasks);

    final index = tasks.indexWhere((t) => t.id == task.id);
    tasks[index] = tasks[index].copyWith(
      isCompleted: !tasks[index].isCompleted,
    );

    emit(TaskSuccess(tasks: tasks));
  }

  Future<void> loadTask() async {
    emit(TaskLoading());
    try {
      final tasks = await _taskRepository.getTasks();
      emit(TaskSuccess(tasks: tasks));
    } catch (e) {
      emit(TaskError(message: 'Ошибка'));
    }
  }
}
