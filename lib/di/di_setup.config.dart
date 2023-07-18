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
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/helper/network_info.dart' as _i7;
import '../features/notes/cubit/note_cubit.dart' as _i16;
import '../features/notes/data/repository/note_repo_impl.dart' as _i9;
import '../features/notes/domain/repository/note_repository.dart' as _i8;
import '../features/user/data/remote_data_source/user_remote_data_source_impl.dart'
    as _i12;
import '../features/user/data/repository/user_repository_impl.dart' as _i14;
import '../features/user/domain/repository/user_remote_data_source.dart'
    as _i11;
import '../features/user/domain/repository/user_repository.dart' as _i13;
import '../features/user/presentation/cubit/credential/cubit/auth_cubit.dart'
    as _i15;
import '../features/user/presentation/cubit/profile/cubit/profile_cubit.dart'
    as _i17;
import 'app_module.dart' as _i18;

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
  gh.singleton<_i5.FirebaseStorage>(appModule.firebaseStorage);
  gh.singleton<_i6.GoogleSignIn>(appModule.googleSignin);
  gh.factory<_i7.NetworkInfo>(() => _i7.NetworkInfoImpl());
  gh.factory<_i8.NoteRepository>(() => _i9.NoteRepoImpl(
        firebaseFirestore: gh<_i4.FirebaseFirestore>(),
        firebaseStorage: gh<_i5.FirebaseStorage>(),
        firebaseAuth: gh<_i3.FirebaseAuth>(),
      ));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => sharedPrefsInjectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i11.UserRemoteDataSource>(() => _i12.UserRemoteDataSourceImpl(
        firebaseFirestore: gh<_i4.FirebaseFirestore>(),
        firebaseAuth: gh<_i3.FirebaseAuth>(),
        googleSignIn: gh<_i6.GoogleSignIn>(),
      ));
  gh.factory<_i13.UserRepository>(() => _i14.UserRepositoryImpl(
      userRemoteDataSource: gh<_i11.UserRemoteDataSource>()));
  gh.singleton<_i15.AuthCubit>(
      _i15.AuthCubit(userRepository: gh<_i13.UserRepository>()));
  gh.singleton<_i16.NoteCubit>(
      _i16.NoteCubit(noteRepository: gh<_i8.NoteRepository>()));
  gh.factory<_i17.ProfileCubit>(
      () => _i17.ProfileCubit(userRepository: gh<_i13.UserRepository>()));
  return getIt;
}

class _$AppModule extends _i18.AppModule {}

class _$SharedPrefsInjectionModule extends _i18.SharedPrefsInjectionModule {}
