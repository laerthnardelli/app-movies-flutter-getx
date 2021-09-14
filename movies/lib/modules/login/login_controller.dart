import 'package:get/get.dart';
import 'package:movies/application/ui/loader/loader_mixin.dart';
import 'package:movies/application/ui/messages/messages_mixin.dart';
import 'package:movies/services/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MaessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  void login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login Realizado com sucesso'));
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(
          MessageModel.error(title: 'Erro', message: 'Erro ao realizar Login'));
    }
  }
}
