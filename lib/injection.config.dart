// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/auth/base_auth_repository.dart' as _i6;
import 'infrastructure/auth/auth_repository.dart' as _i7;
import 'infrastructure/core/core_injectable_modules.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final coreInjectableModule = _$CoreInjectableModule();
  gh.factory<_i3.FirebaseAuth>(() => coreInjectableModule.firebaseAuth);
  gh.factory<_i4.FirebaseFirestore>(() => coreInjectableModule.firestore);
  gh.factory<_i5.GoogleSignIn>(() => coreInjectableModule.googleSignIn);
  gh.lazySingleton<_i6.BaseAuthRepository>(() => _i7.FirebaseAuthRepository(
      get<_i5.GoogleSignIn>(),
      get<_i3.FirebaseAuth>(),
      get<_i4.FirebaseFirestore>()));
  return get;
}

class _$CoreInjectableModule extends _i8.CoreInjectableModule {}
