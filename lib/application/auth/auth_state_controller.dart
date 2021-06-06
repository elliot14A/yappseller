import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yappadmin/application/auth/auth_state.dart';
import 'package:yappadmin/domain/auth/base_auth_repository.dart';
import 'package:yappadmin/domain/core/auth_failures.dart';
import 'package:yappadmin/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateController, AuthState>((ref) {
  return AuthStateController(getIt<BaseAuthRepository>());
});

class AuthStateController extends StateNotifier<AuthState> {
  final BaseAuthRepository _authRepository;
  AuthStateController(this._authRepository) : super(AuthState.initial());
  void authorize() async {
    final user = await _authRepository.getCurrentUser();
    user.fold(() => state = AuthState.notAuthenticated(),
        (_) => state = AuthState.authenticated());
  }

  Future<Either<AuthFailure, Unit>> signIn() async {
    final authFailureOrSuccess = await _authRepository.signInWithGoogle();
    authFailureOrSuccess.fold((l) => state = AuthState.notAuthenticated(),
        (r) => AuthState.authenticated());
    return authFailureOrSuccess;
  }

  Future<Either<WelcomeRoute, HomeRoute>> registerUser() async {
    final userRegistered = await _authRepository.isRegisteredUser();
    print(userRegistered);
    if (userRegistered) {
      return right(HomeRoute());
    } else {
      _authRepository.registerUser();
      return left(WelcomeRoute());
    }
  }

  void signOut() {
    _authRepository.signOut();
    state = AuthState.notAuthenticated();
  }
}
