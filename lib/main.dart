import 'package:cubit_example/controller/tasks/task_cubit.dart';
import 'package:cubit_example/controller/users/user_cubit.dart';
import 'package:cubit_example/repository/tasks/task_repository.dart';
import 'package:cubit_example/repository/users/user_repositores.dart';
import 'package:cubit_example/ui/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(UserRepositoryImpl())..loadUser(),
        ),
        BlocProvider(
          create: (context) => TaskCubit(TaskRepositoryImpl())..loadTask(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const TaskScreen(),
      ),
    );
  }
}
