import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _sp;

  static Future<void> init() async {
    _sp ??= await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    if (kDebugMode) {
      print('save token : $token');
    }
    _sp ??= await SharedPreferences.getInstance();
    _sp!.setString('token', token);
  }

  static Future<String?> getToken() async {
    _sp ??= await SharedPreferences.getInstance();
    return _sp?.getString('token');
  }

  static Future<void> removeToken() async {
    _sp ??= await SharedPreferences.getInstance();
    _sp!.remove('token');
  }

  static Future<void> setIdUser(String idUser) async {
    if (kDebugMode) {
      print('save idUser : $idUser');
    }
    _sp ??= await SharedPreferences.getInstance();
    _sp!.setString('idUser', idUser);
  }

  static Future<String?> getIduser() async {
    _sp ??= await SharedPreferences.getInstance();
    return _sp!.getString('idUser');
  }

  static Future<void> removeIdUser() async {
    _sp ??= await SharedPreferences.getInstance();
    _sp!.remove('idUser');
  }
}
