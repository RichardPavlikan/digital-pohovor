import 'package:digital/common/message/display_message.dart';
import 'package:digital/config/router/app_router.dart';
import 'package:digital/common/widgets/app_button.dart';
import 'package:digital/presentation/user/pages/user_page.dart';
import 'package:digital/presentation/users/page/users_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppButton(
                  onPressed: () => AppRouter.push(
                        context,
                        const UserPage(),
                      ),
                  text: "Profil"),
              AppButton(
                  onPressed: () => AppRouter.push(
                        context,
                        const UsersPage(),
                      ),
                  text: "Uživatelé"),
              AppButton(
                  onPressed: () => DisplayMessage.errorMessage(
                      "Nestihl jsem to... :O", context),
                  text: "Výplaty"),
            ],
          ),
        ),
      ),
    );
  }
}
