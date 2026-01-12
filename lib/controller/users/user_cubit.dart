import 'package:cubit_example/controller/users/user_state.dart';
import 'package:cubit_example/data/models/users/user_models.dart';
import 'package:cubit_example/repository/users/user_repositores.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepositores;

  UserCubit(this.userRepositores) : super(UserInitial());
}
