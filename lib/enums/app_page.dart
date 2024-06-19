import 'package:flutter/material.dart';
import 'package:pos_app/pages/login_page.dart';
import 'package:pos_app/pages/register_page.dart';
import 'package:pos_app/pages/splash_page.dart';

enum AppPage {
  splash,
  login,
  register,
  home,
}

extension AppPageExtension on AppPage {
  Widget get page {
    switch (this) {
      case AppPage.splash:
        return const SplashPage();
      case AppPage.login:
        return const LoginPage();
      case AppPage.register:
        return const RegisterPage();
      default:
        return const Text('Error: Invalid AppPage');
      // NOTE:May use in future
      // case AppPage.register:
      //   return 'register';
      // case AppPage.home:
      //   return 'home';
    }
  }
}
