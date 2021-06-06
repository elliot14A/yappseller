import 'package:dartz/dartz.dart';
import 'package:yappadmin/domain/core/auth_failures.dart';
import 'package:yappadmin/domain/core/entities/user_entity.dart';

abstract class BaseAuthRepository {
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  void signOut();
  Future<Option<CurrentUser>> getCurrentUser();
  void registerUser();
  Future<bool> isRegisteredUser();
}
