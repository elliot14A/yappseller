import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yappadmin/application/auth/auth_state.dart';
import 'package:yappadmin/domain/auth/base_auth_repository.dart';
import 'package:yappadmin/injection.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateController, AuthState>((ref) {
  final controller = AuthStateController(getIt<BaseAuthRepository>());
  return controller;
});

class AuthStateController extends StateNotifier<AuthState> {
  final BaseAuthRepository _authRepository;
  AuthStateController(this._authRepository) : super(AuthState.initial());
  void authorize() async {
    final user = await _authRepository.getCurrentUser();
    user.fold(() => state = AuthState.notAuthenticated(),
        (_) => state = AuthState.authenticated());
  }

  void signOut() {
    _authRepository.signOut();
    state = AuthState.notAuthenticated();
  }
}
