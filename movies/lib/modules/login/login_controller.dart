import 'package:get/get.dart';
import 'package:movies/application/ui/loader/loader_mixin.dart';
import 'package:movies/application/ui/messages/messages_mixin.dart';
import 'package:movies/services/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MaessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService
    loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  void login() async {
    loading.value = true;
    await 2.seconds.delay();
    //await Future.delayed(Duration(seconds: 2));
    //loading.value = false;
    loading(false);
    message(
        MessageModel.error(title: 'Título Erro', message: 'Menssagem de Erro'));
    await 1.seconds.delay();
    message(
        MessageModel.info(title: 'Título Info', message: 'Menssagem de Info'));
    await 1.seconds.delay();
  }
}
