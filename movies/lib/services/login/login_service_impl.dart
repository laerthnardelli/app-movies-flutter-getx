import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/repositories/login/login_repository.dart';
import 'package:movies/services/login/login_service.dart';

class LoginServiceImpl implements LoginService {
  LoginRepository _loginRepository;

  LoginServiceImpl({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();

  @override
  Future<void> logout() => _loginRepository.logout();
}
