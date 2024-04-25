import 'package:fpdart/fpdart.dart';
import 'package:shbsantri/domain/core/interfaces/auth_interface.dart';
import 'package:shbsantri/domain/core/interfaces/service_interface.dart';
import 'package:shbsantri/domain/core/models/user_model.dart';
import 'package:shbsantri/infrastructure/dal/daos/local_storage.dart';
import 'package:shbsantri/utils/network/endpoint.dart';

class AuthService extends ServiceInterface implements AuthInterface {
  @override
  Future<Either<String, UserModel>> getCurrentUser() async {
    String? idUser = await LocalStorage.getIduser();
    String url = '${Endpoint.user}/$idUser';

    try {
      print(url);
      final response = await dio.get(url);

      print(response.data);
      return Right(UserModel.fromJson(response.data['data']));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Object>> signInWithEmail(
      String email, String password) async {
    try {
      Map<String, dynamic> payload() {
        final Map<String, dynamic> data = {};
        data['email'] = email;
        data['password'] = password;
        return data;
      }

      final response = await dio.post(Endpoint.login, data: payload());
      await LocalStorage.setToken(response.data['data']['token']);
      await LocalStorage.setIdUser(response.data['data']['id'].toString());
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
