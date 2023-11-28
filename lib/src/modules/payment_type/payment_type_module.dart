import 'package:flutter_modular/flutter_modular.dart';

import 'payment_type_page.dart';

class PaymentTypeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentTypePage()),
  ];
}
