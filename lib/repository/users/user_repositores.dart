import 'package:cubit_example/data/models/users/user_models.dart';

abstract class UserRepository {
  Future<List<User>> getUsers(); // метод получение списка пользователей
}

// конкретная реализация репозитория пользователей - который возврощает данные

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      User(id: 1, name: 'Alice'),
      User(id: 2, name: 'Bob'),
      User(id: 3, name: 'Charlie'),
    ];
  }
}
