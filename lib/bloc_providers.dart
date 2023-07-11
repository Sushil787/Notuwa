import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/core/theme/theme_cubit.dart';

/// Returns the list of Providers
List<BlocProvider> getProviders() {
  return [
    BlocProvider(
      create: (context) => ThemeCubit(),
    ),
  ];
}
