import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';
import '../../services/auth/login_service.dart';
import '../../services/auth/login_service_impl.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthRepository>(
      (i) => AuthRepositoryImpl(i()),
    ),
    Bind.lazySingleton<LoginService>(
      (i) => LoginServiceImpl(i(), i()),
    ),
    Bind.lazySingleton(
      (i) => LoginController(
        i(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const LoginPage(),
    ),
  ];
}
