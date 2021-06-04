// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/auth/base_auth_repository.dart' as _i5;
import 'infrastructure/auth/auth_repository.dart' as _i6;
import 'infrastructure/core/core_injectable_modules.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final coreInjectableModule = _$CoreInjectableModule();
  gh.factory<_i3.FirebaseAuth>(() => coreInjectableModule.firebaseAuth);
  gh.factory<_i4.GoogleSignIn>(() => coreInjectableModule.googleSignIn);
  gh.lazySingleton<_i5.BaseAuthRepository>(() => _i6.FirebaseAuthRepository(
      get<_i4.GoogleSignIn>(), get<_i3.FirebaseAuth>()));
  return get;
}

class _$CoreInjectableModule extends _i7.CoreInjectableModule {}
