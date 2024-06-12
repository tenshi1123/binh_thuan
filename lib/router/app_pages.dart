// ignore_for_file: constant_identifier_names

import 'package:binh_thuan/modules/auth/forgor_password/change_password_screen.dart';
import 'package:binh_thuan/modules/auth/forgor_password/forgot_password_screen.dart';
import 'package:binh_thuan/modules/auth/forgor_password/otp_screen.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/interactive.dart';
import 'package:binh_thuan/modules/notification/notification_screen.dart';
import 'package:binh_thuan/modules/tuition/tuition_screen.dart';

import '../modules/auth/login/login_screen.dart';
import 'page_config.dart';

enum AppPages {
  Initial,
  LoginPage,
  ForgotPassScreen,
  OtpScreen,
  ChangePassScreen,
  NavigationBar,
  NotificationScreen,
  TuitionPage,
}

final RegExp _keyPattern = RegExp('(?<=[a-z])[A-Z]');

extension AppPagesExtension on AppPages {
  String get key => toString()
      .split('.')
      .last
      .replaceAll('_', '.')
      .replaceAllMapped(
        _keyPattern,
        (Match m) => "_${m.group(0) ?? ''}",
      )
      .toLowerCase();

  String get path => "/${key.replaceAll('.', '/')}";

  String get name => path;
  static PageConfig getPageConfig(
    AppPages page,
    Map<String, dynamic>? arguments,
  ) {
    switch (page) {
      case AppPages.Initial:
      //Auth
      case AppPages.LoginPage:
        return PageConfig()..pageBuilder = () => const LoginScreen();
      case AppPages.ForgotPassScreen:
        return PageConfig()..pageBuilder = () => const ForgotPassScreen();
      case AppPages.OtpScreen:
        final String contact = arguments!['contact'];
        return PageConfig()
          ..pageBuilder = () => OtpScreen(
                contact: contact,
              );
      case AppPages.ChangePassScreen:
        return PageConfig()..pageBuilder = () => const ChangePassScreen();
      case AppPages.NavigationBar:
        return PageConfig()..pageBuilder = () => const InteractiveExample();
      case AppPages.NotificationScreen:
        return PageConfig()..pageBuilder = () => const NotificationScreen();
      case AppPages.TuitionPage:
        return PageConfig()..pageBuilder = () => const TuitionScreen();
      default:
        throw StateError(
          "Missing page: ${page.toString()} in AppPagesExtension.getPageConfig()",
        );
    }
  }

  static PageConfig getPageConfigForUnknownRouteName(String? name) =>
      getPageConfig(
        name == AppPages.Initial.name || name?.isEmpty == true
            ? AppPages.Initial
            : AppPages.values.firstWhere(
                (e) => e.name.contains(name!),
                orElse: () => AppPages.Initial,
              ),
        {},
      );
}
