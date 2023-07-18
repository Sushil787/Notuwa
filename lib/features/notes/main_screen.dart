
import 'package:flutter/material.dart';
import 'package:kuraa/di/di_setup.dart';
import 'package:kuraa/features/notes/home_screen.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt<UserRepository>().authStateChange(),
      builder: (context, snapshot) {
        return snapshot.data?.uid != null
            ? HomeScreen(uid: snapshot.data!.uid)
            : const LoginScreen();
      },
    );
  }
}
