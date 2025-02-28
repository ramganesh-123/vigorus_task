import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vigorus_task/pages/signinpage/signin.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppRouter {
  static final List<GetPage> routers = [
    GetPage(
      name: "/",
      page: () => SignInScreen(),
    ),
  ];
}
