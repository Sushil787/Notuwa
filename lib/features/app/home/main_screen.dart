import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/features/app/home/home_screen.dart';
import 'package:kuraa/features/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:kuraa/features/user/presentation/ui/login_screen.dart';

/// MainScreen
class MainScreen extends StatefulWidget {
  ///
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // context.watch<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, AuthState state) {
        return state is Authenticated
            ? const HomeScreen()
            : const LoginScreen();
      },
    );
  }
}
