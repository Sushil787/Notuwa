import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kuraa/core/routes/app_router.dart';
import 'package:kuraa/core/theme/app_theme.dart';
import 'package:kuraa/core/theme/theme_cubit.dart';
import 'package:kuraa/di/di_setup.dart';
import 'package:kuraa/features/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/credential/cubit/credential_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/profile/cubit/single_user_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/users/cubit/user_cubit.dart';
import 'package:kuraa/firebase_options.dart';
import 'package:kuraa/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (context) => getIt<CredentialCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SingleUserCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UserCubit>(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

/// Navigator key
GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

/// MyApp
class MyApp extends StatefulWidget {
  ///
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  final routerConfig = AppRouter();

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: routerConfig.router,
          key: _navigatorKey,
          title: 'Chat appa',
          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode:
              state == ThemeState.light ? ThemeMode.light : ThemeMode.dark,
        );
      },
    );
  }
}
