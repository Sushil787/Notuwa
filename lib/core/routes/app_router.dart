// ignore_for_file: cast_nullable_to_non_nullable

import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/core/widgets/splash_screen.dart';
import 'package:kuraa/features/notes/domain/model/notes_model.dart';
import 'package:kuraa/features/notes/home_screen.dart';
import 'package:kuraa/features/notes/main_screen.dart';
import 'package:kuraa/features/notes/note_screen.dart';
import 'package:kuraa/features/user/presentation/ui/login_screen.dart';
import 'package:kuraa/features/user/presentation/ui/profile_screen.dart';
import 'package:kuraa/features/user/presentation/ui/signup_screen.dart';

/// AppRouter
class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) {
          return HomeScreen(
            uid: state.extra! as String,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        builder: (context, state) => ProfileScreen(
          uid: state.extra! as String,
        ),
      ),
      GoRoute(
        path: AppRoutes.main,
        name: AppRoutes.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.signup,
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.note,
        name: AppRoutes.note,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return NoteScreen(
            createMode: args['createMode'] as bool,
            note: args['note'] as NoteModel?,
          );
        },
      ),
    ],
  );

  /// Router Getter
  GoRouter get router => _router;
}
