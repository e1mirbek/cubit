import 'package:cubit_example/data/models/users/user_models.dart';

abstract class UserRepository {
  Future<List<User>> getUsers(); // метод получение списка пользователей
}

// передача данных

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      User(id: 1, name: 'Alice'),
      User(id: 2, name: 'Bob'),
      User(id: 3, name: 'Charlie'),
    ];
  }
}
