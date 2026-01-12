import 'package:cubit_example/data/models/users/user_models.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  List<User> users;
  UserLoaded({required this.users});
}

class UserError extends UserState {
  final String errorMessage;
  UserError({required this.errorMessage});
}
