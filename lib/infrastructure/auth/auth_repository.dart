import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:yappadmin/domain/auth/base_auth_repository.dart';
import 'package:yappadmin/domain/core/auth_failures.dart';
import 'package:yappadmin/domain/core/entities/user_entity.dart';
import 'package:yappadmin/domain/core/user_failure_error.dart';
import 'package:yappadmin/infrastructure/extensions/firebase_extension.dart';

@LazySingleton(as: BaseAuthRepository)
class FirebaseAuthRepository implements BaseAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  const FirebaseAuthRepository(
      this._googleSignIn, this._firebaseAuth, this._firestore);
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
    } on PlatformException catch (e) {
      print(e.toString());
      if (e.code == "sign_in_canceled")
        return left(AuthFailure.cancelledByUser());
      if (e.code == "network_error") return left(AuthFailure.networkError());
      return left(AuthFailure.serverError());
    } catch (e) {
      print(e);
      if (e.toString() == "Null check operator used on a null value")
        return left(AuthFailure.cancelledByUser());
      return left(AuthFailure.serverError());
    }
  }

  @override
  void signOut() {
    Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
  }

  @override
  Future<bool> isRegisteredUser() async {
    final CurrentUser user = await getCurrentUser().then(
        (value) => value.fold(() => throw AuthFailure.cancelledByUser(), id));
    return await _firestore
        .collection('users')
        .doc(user.id)
        .get()
        .then((value) {
      return value.exists;
    });
  }

  @override
  void registerUser() async {
    final user = await getCurrentUser()
        .then((value) => value.fold(() => throw UserFailureError(), id));
    await _firestore.collection('users').doc(user.id).set({"uid": user.id});
  }
}
