import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/interfaces/auth_interface.dart';
import 'package:shbsantri/domain/core/interfaces/service_interface.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class AuthService extends ServiceInterface implements AuthInterface {
  @override
  Future<Either<String, String>> getCurrentUserId() async {
    return const Right('');
  }

  @override
  Future<Either<String, Object>> signInWithEmail(
      String email, String password) async {
    try {
      final response = await dio
          .post(Endpoint.login, data: {'email': email, 'password': password});
      return Right(response.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmail(String email, String password) {
    // TODO: implement signUpWithEmail
    throw UnimplementedError();
  }
}
