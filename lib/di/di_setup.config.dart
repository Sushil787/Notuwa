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

import '../features/user/data/remote_data_source/user_remote_data_source_impl.dart'
    as _i7;
import '../features/user/data/repository/user_repository_impl.dart' as _i9;
import '../features/user/domain/repository/user_remote_data_source.dart' as _i6;
import '../features/user/domain/repository/user_repository.dart' as _i8;
import 'app_module.dart' as _i10;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i4.FirebaseFirestore>(() => appModule.store);
  gh.factory<_i5.GoogleSignIn>(() => appModule.googleSignin);
  gh.factory<_i6.UserRemoteDataSource>(() => _i7.UserRemoteDataSourceImpl(
        firebaseFirestore: gh<_i4.FirebaseFirestore>(),
        firebaseAuth: gh<_i3.FirebaseAuth>(),
        googleSignIn: gh<_i5.GoogleSignIn>(),
      ));
  gh.factory<_i8.UserRepository>(() => _i9.UserRepositoryImpl(
      userRemoteDataSource: gh<_i6.UserRemoteDataSource>()));
  return getIt;
}

class _$AppModule extends _i10.AppModule {}
