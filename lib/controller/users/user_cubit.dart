import 'package:cubit_example/controller/users/user_state.dart';
import 'package:cubit_example/repository/users/user_repositores.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> loadUser() async {
    emit(UserLoading());
    try {
      final user = await userRepository.getUsers();
      emit(UserLoaded(users: user));
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }
}
