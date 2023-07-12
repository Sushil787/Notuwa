import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/core/theme/theme_cubit.dart';
import 'package:kuraa/di/di_setup.dart';
import 'package:kuraa/features/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/credential/cubit/credential_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/profile/cubit/single_user_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/users/cubit/user_cubit.dart';

/// Returns the list of Providers
List<BlocProvider> getProviders() {
  return [
    BlocProvider(
      create: (context) => ThemeCubit(),
    ),
    BlocProvider(
      create: (context) => getIt<AuthCubit>(),
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
  ];
}
