import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/features/app/home/home_screen.dart';
import 'package:kuraa/features/app/home/main_screen.dart';
import 'package:kuraa/features/user/presentation/ui/signup_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// AppRouter
class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.main,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );

  /// Router Getter
  GoRouter get router => _router;
}
