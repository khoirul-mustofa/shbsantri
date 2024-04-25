import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/models/user_model.dart';

abstract class AuthInterface {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<Either<String, UserModel>> getCurrentUser();
}
