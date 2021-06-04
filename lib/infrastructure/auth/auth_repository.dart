import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:yappadmin/domain/auth/base_auth_repository.dart';
import 'package:yappadmin/domain/core/auth_failures.dart';
import 'package:yappadmin/domain/core/entities/user_entity.dart';
import 'package:yappadmin/infrastructure/extensions/firebase_extension.dart';

@LazySingleton(as: BaseAuthRepository)
class FirebaseAuthRepository implements BaseAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  const FirebaseAuthRepository(this._googleSignIn, this._firebaseAuth);
  @override
  Future<Option<CurrentUser>> getCurrentUser() {
    return Future.delayed(Duration(seconds: 2),
        () => optionOf(_firebaseAuth.currentUser?.toCurrentUser()));
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      final googleAuthenticate = await googleAccount!.authentication;
      final googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuthenticate.accessToken,
          idToken: googleAuthenticate.idToken);
      await _firebaseAuth.signInWithCredential(googleCredential);
      return right(unit);
    } catch (e) {
      print(e);
      return left(AuthFailure.serverError());
    }
  }

  @override
  void signOut() {
    Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
  }
}
