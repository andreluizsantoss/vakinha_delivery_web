import 'package:flutter_modular/flutter_modular.dart';

import 'home/products_page.dart';

class ProdutcsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProductsPage()),
        // ChildRoute('/details', child: (context, args) => const ProductsPage()),
      ];
}
