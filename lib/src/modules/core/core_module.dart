import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/storage.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<Storage>(
      (i) => SessionStorage(),
      export: true,
    ),
    Bind.factory(
      (i) => CustomDio(i()),
      export: true,
    ),
  ];
}
