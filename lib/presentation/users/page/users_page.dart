import 'package:digital/common/widgets/user_profile_widget.dart';
import 'package:digital/data/user/models/user_model.dart';
import 'package:digital/presentation/users/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uživatelé"),
      ),
      body: SafeArea(
        child: BlocBuilder<UsersCubit, UsersState>(
            bloc: UsersCubit()..getUsers(),
            builder: (context, state) {
              if (state is UsersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UsersLoaded) {
                return _userData(context: context, userList: state.users);
              } else if (state is UsersError) {
                return Text(state.message);
              } else {
                return const Text("Unknown state");
              }
            }),
      ),
    );
  }

  Widget _userData(
      {required BuildContext context, required List<UserModel> userList}) {
    return Center(
      child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];

            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    scrollable: true,
                    content: UserProfileWidget(
                      user,
                    ),
                  ),
                );
              },
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.name ?? "Bez jména",
                  ),
                ),
              ),
            );
          }),
    );
  }
}
