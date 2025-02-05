import 'package:digital/data/user/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget(this.user, {super.key});

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.name ?? "Bez jména",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            user.email ?? "Bez emailu",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            (user.active ?? false) ? "Aktivní" : "Neaktivní",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            user.note != null ? "Poznámka: ${user.note}" : "Bez poznámky :C",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Založeno: ${user.createdAt?.day}. ${user.createdAt?.month}. ${user.createdAt?.year}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
