import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/features/app/home/home_screen.dart';
import 'package:kuraa/features/user/presentation/cubit/credential/cubit/auth_cubit.dart';
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
  void initState() {
    context.read<AuthCubit>().appStarted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        log(state.toString(), name: 'listner is listeing.');
      },
      builder: (context, state) {
        return state is Authenticated
            ? HomeScreen(uid: state.uid)
            : const LoginScreen();
      },
    );
  }
}
