import 'package:digital/common/widgets/user_profile_widget.dart';
import 'package:digital/config/router/app_router.dart';
import 'package:digital/data/user/models/user_model.dart';
import 'package:digital/main.dart';
import 'package:digital/common/widgets/app_button.dart';
import 'package:digital/presentation/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Můj profil"),
      ),
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
            bloc: UserCubit()..getUser(),
            builder: (context, state) {
              if (state is UserLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserLoaded) {
                return _userData(context: context, user: state.user);
              } else if (state is UserError) {
                return Text(state.message);
              } else {
                return const Text("Unknown state");
              }
            }),
      ),
    );
  }

  Widget _userData({required BuildContext context, required UserModel user}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserProfileWidget(user),
          const SizedBox(height: 50),
          AppButton(
              onPressed: () {
                UserCubit().logout();

                AppRouter.pushReplacement(context, const MainApp());
              },
              text: "Odhlásit se"),
        ],
      ),
    );
  }
}
