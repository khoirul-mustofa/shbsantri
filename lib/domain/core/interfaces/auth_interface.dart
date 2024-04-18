import 'package:fpdart/fpdart.dart';

abstract class AuthInterface {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<Either<dynamic, String>> getCurrentUserId();
}
