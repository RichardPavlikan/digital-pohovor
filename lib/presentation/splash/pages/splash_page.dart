import 'package:digital/config/router/app_router.dart';
import 'package:digital/presentation/auth/pages/auth_page.dart';
import 'package:digital/presentation/home/pages/home_page.dart';
import 'package:digital/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
          bloc: SplashCubit()..appStarted(),
          listener: (context, state) {
            if (state is SplashLogged) {
              AppRouter.pushReplacement(
                context,
                const HomePage(),
              );
            }

            if (state is SplashNotLogged) {
              AppRouter.pushReplacement(
                context,
                AuthPage(),
              );
            }
          },
          child: const SafeArea(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                  Text("Digital..."),
                ],
              ),
            ),
          )),
    );
  }
}
