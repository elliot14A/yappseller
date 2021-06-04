import 'package:firebase_auth/firebase_auth.dart';
import 'package:yappadmin/domain/core/entities/user_entity.dart';

extension FirebaseUserX on User {
  CurrentUser toCurrentUser() {
    return CurrentUser(uid);
  }
}
