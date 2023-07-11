import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/di/di_setup.dart';
import 'package:kuraa/features/user/domain/repository/user_remote_data_source.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// AppRouter
class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {},
    routes: [
      GoRoute(path: AppRoutes.home, builder: (context, state) => HomePAge()),
    ],
  );

  /// Router Getter
  GoRouter get router => _router;
}

class HomePAge extends StatelessWidget {
  const HomePAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            'google sign in',
          ),
          onPressed: () async {
            final authProvider = getIt<UserRemoteDataSource>();
            await authProvider.googleAuth();
          },
        ),
      ),
    );
  }
}
