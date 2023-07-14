import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/core/widgets/splash_screen.dart';
import 'package:kuraa/features/app/home/home_screen.dart';
import 'package:kuraa/features/app/home/main_screen.dart';
import 'package:kuraa/features/user/presentation/ui/login_screen.dart';
import 'package:kuraa/features/user/presentation/ui/signup_screen.dart';

/// AppRouter
class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) {
          return HomeScreen(
            uid: state.extra! as String,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );

  /// Router Getter
  GoRouter get router => _router;
}
