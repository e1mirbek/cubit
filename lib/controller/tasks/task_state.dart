import 'package:cubit_example/data/models/tasks/task.dart';
import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  final List<Task> tasks;

  TaskSuccess({this.tasks = const []});

  @override
  List<Object?> get props => [tasks];
}

class TaskError extends TaskState {
  final String message;

  TaskError({required this.message});

  @override
  List<Object?> get props => [message];
}
