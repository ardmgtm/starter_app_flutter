import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../providers/authentication_provider.dart';

class GuestMiddleware extends GetMiddleware {
  final AuthenticationProvider authenticationProvider;

  GuestMiddleware({
    super.priority,
    required this.authenticationProvider,
  });

  @override
  RouteSettings? redirect(String? route) {
    bool isAuthenticated = authenticationProvider.isAuthenticated();
    if (isAuthenticated) {
      return const RouteSettings(name: Routes.HOME);
    } else {
      return null;
    }
  }
}
