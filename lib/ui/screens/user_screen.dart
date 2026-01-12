import 'package:cubit_example/controller/users/user_cubit.dart';
import 'package:cubit_example/controller/users/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  final String title;
  const UserScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();

    // вызываем один раз после build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.loadUser();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is UserLoaded) {
            return RefreshIndicator(
              onRefresh: () => cubit.loadUser(),
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(state.users[index].id.toString()),
                      ),
                      title: Text(state.users[index].name),
                    ),
                  );
                },
              ),
            );
          } else {
            cubit.loadUser();
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
