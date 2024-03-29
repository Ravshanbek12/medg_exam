import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:medg_exam/assets/colors.dart";
import "package:medg_exam/core/routs_name/app_rout_name.dart";
import "package:medg_exam/features/authentication/presentation/bloc/auth_bloc.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../injector/injector.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.unauthenticated) {
            if (sl<SharedPreferences>().getBool("wizard") == true&&state.authenticatedUser.email.isEmpty) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRouteNames.sigUp, (_) => false);
            } else if (sl<SharedPreferences>().getBool("wizard") == null ||
                sl<SharedPreferences>().getBool("wizard") == false) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRouteNames.onBoarding, (_) => false);

            }
          } else if (state.status == AuthenticationStatus.authenticated) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouteNames.basicController, (_) => false);
          }
        },
        builder: (context, state) {
          print("status: ${state.status}");
          if (state.status == AuthenticationStatus.unknown) {
            Timer(const Duration(seconds: 3), () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationGetStatusEvent());
              // Navigator.pushNamedAndRemoveUntil(
              //     context, AppRouteNames.onBoarding, (route) => false);
            });
          }
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  // Expanded(child: CupertinoActivityIndicator(),),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 32),
              child: const SizedBox(
                child: CupertinoActivityIndicator(
                  radius: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
