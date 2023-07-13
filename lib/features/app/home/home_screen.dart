import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/features/user/presentation/cubit/auth/cubit/auth_cubit.dart';

/// Home Screen

class HomeScreen extends StatefulWidget {
  ///
  const HomeScreen({required this.uid, super.key});

  /// UID
  final String uid;
  @override
  State<HomeScreen> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.uid,
              style: const TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.read<AuthCubit>().signOut();
              },
              child: const Text('signout'),
            ),
          ],
        ),
      ),
    );
  }
}
