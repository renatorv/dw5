import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';
import '../../../core/rest_client/rest_client.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      await _authRepository.register(name, email, password);
      _loading.toggle();
      // ignore: todo
      //TODO: Voltar aqui quando fizer o login
      // final userLogged = await _authRepository.register(name, email, password);
      // _loading.toggle();
      // GetStorage().write(Constants.USER_KEY, userLogged.id);
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar usuário',
          type: MessageType.error,
        ),
      );
    }
  }

  // void qq() {
  //   _message(
  //     MessageModel(
  //       title: 'Teste',
  //       message: 'Mensagem Teste',
  //       type: MessageType.error,
  //     ),
  //   );
  //   // loading.toggle();
  //   // Future.delayed(
  //   //   const Duration(seconds: 2),
  //   //   () => loading.toggle(),
  //   // );
  // }
}
