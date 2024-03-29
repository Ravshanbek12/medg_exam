import 'package:flutter/cupertino.dart';
import 'package:medg_exam/core/functions/app_functions.dart';
import 'package:medg_exam/core/pages/onboarding.dart';
import 'package:medg_exam/core/pages/splash.dart';
import 'package:medg_exam/features/authentication/presentation/pages/login.dart';
import 'package:medg_exam/features/authentication/presentation/pages/signup.dart';
import 'package:medg_exam/features/calendar/calendar_screen.dart';
import 'package:medg_exam/features/home/presentation/pages/basic_controller.dart';
import 'package:medg_exam/features/home/presentation/pages/main_page.dart';

import '../routs_name/app_rout_name.dart';

class AppRoute {
  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashScreen());
      case AppRouteNames.sigUp:
        return fade(const SignUpScreen());
      case AppRouteNames.sigUp:
        return fade(const LoginScreen());
      case AppRouteNames.onBoarding:
        return fade(const OnBoarding());
      case AppRouteNames.basicController:
        return fade(const BasicController());
      case AppRouteNames.main:
        return fade(const MainPage());
      case AppRouteNames.calendar:
        return fade(const CalendarScreen());
    }
  }
}
