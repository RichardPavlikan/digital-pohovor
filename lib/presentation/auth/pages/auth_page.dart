import 'package:digital/common/message/display_message.dart';
import 'package:digital/common/widgets/app_button.dart';
import 'package:digital/config/router/app_router.dart';
import 'package:digital/data/auth/model/login_params.dart';
import 'package:digital/domain/auth/usecases/login_usecase.dart';
import 'package:digital/presentation/home/pages/home_page.dart';
import 'package:digital/service_locator.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _headerImg(),
                  const SizedBox(height: 60),
                  _emailField(),
                  const SizedBox(height: 20),
                  _passField(),
                  const SizedBox(height: 40),
                  _continueBtn(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerImg() {
    return Image.asset(
      "assets/images/flutter_logo.png",
      width: 100,
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email je povinný";
        }

        return null;
      },
    );
  }

  Widget _passField() {
    return TextFormField(
      controller: passController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Heslo",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Heslo je povinné";
        }

        return null;
      },
    );
  }

  Widget _continueBtn(BuildContext context) {
    return AppButton(
      onPressed: () async {
        if (!_formKey.currentState!.validate()) return;

        debugPrint("Email: ${emailController.text}");

        try {
          final result = await sl<LoginUsecase>().call(
            params: LoginParams(
              email: emailController.text,
              password: passController.text,
            ),
          );

          result.fold((error) {
            DisplayMessage.errorMessage(error.toString(), context);
          }, (success) {
            DisplayMessage.errorMessage("Přihlášení proběhlo úspěšně", context);

            AppRouter.pushReplacement(context, const HomePage());
          });
        } catch (e) {
          debugPrint(e.toString());
        }
      },
      text: "Přihlásit",
    );
  }
}
