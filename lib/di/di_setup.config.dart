// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../core/helper/network_info.dart' as _i6;
import '../features/user/data/remote_data_source/user_remote_data_source_impl.dart'
    as _i9;
import '../features/user/data/repository/user_repository_impl.dart' as _i11;
import '../features/user/domain/repository/user_remote_data_source.dart' as _i8;
import '../features/user/domain/repository/user_repository.dart' as _i10;
import '../features/user/presentation/cubit/auth/cubit/auth_cubit.dart' as _i12;
import '../features/user/presentation/cubit/credential/cubit/credential_cubit.dart'
    as _i13;
import '../features/user/presentation/cubit/profile/cubit/single_user_cubit.dart'
    as _i14;
import '../features/user/presentation/cubit/users/cubit/user_cubit.dart'
    as _i15;
import 'app_module.dart' as _i16;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  final sharedPrefsInjectionModule = _$SharedPrefsInjectionModule();
  gh.singleton<_i3.FirebaseAuth>(appModule.auth);
  gh.singleton<_i4.FirebaseFirestore>(appModule.store);
  gh.singleton<_i5.GoogleSignIn>(appModule.googleSignin);
  gh.factory<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl());
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => sharedPrefsInjectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i8.UserRemoteDataSource>(() => _i9.UserRemoteDataSourceImpl(
        firebaseFirestore: gh<_i4.FirebaseFirestore>(),
        firebaseAuth: gh<_i3.FirebaseAuth>(),
        googleSignIn: gh<_i5.GoogleSignIn>(),
      ));
  gh.factory<_i10.UserRepository>(() => _i11.UserRepositoryImpl(
      userRemoteDataSource: gh<_i8.UserRemoteDataSource>()));
  gh.factory<_i12.AuthCubit>(
      () => _i12.AuthCubit(userRepository: gh<_i10.UserRepository>()));
  gh.factory<_i13.CredentialCubit>(
      () => _i13.CredentialCubit(userRepository: gh<_i10.UserRepository>()));
  gh.factory<_i14.SingleUserCubit>(
      () => _i14.SingleUserCubit(userRepository: gh<_i10.UserRepository>()));
  gh.factory<_i15.UserCubit>(
      () => _i15.UserCubit(userRepository: gh<_i10.UserRepository>()));
  return getIt;
}

class _$AppModule extends _i16.AppModule {}

class _$SharedPrefsInjectionModule extends _i16.SharedPrefsInjectionModule {}
