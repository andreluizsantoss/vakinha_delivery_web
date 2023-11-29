import 'package:flutter_modular/flutter_modular.dart';
import 'modules/core/core_module.dart';
import 'modules/login/login_module.dart';
import 'modules/payment_type/payment_type_module.dart';
import 'modules/products/produtcs_module.dart';
import 'modules/template/base_layout.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login/', module: LoginModule()),
    ChildRoute(
      '/',
      child: (context, args) => const BaseLayout(
        body: RouterOutlet(),
      ),
      transition: TransitionType.noTransition,
      children: [
        ModuleRoute(
          '/payment-type',
          module: PaymentTypeModule(),
        ),
        ModuleRoute(
          '/product',
          module: ProdutcsModule(),
        ),
      ],
    ),
  ];
}
