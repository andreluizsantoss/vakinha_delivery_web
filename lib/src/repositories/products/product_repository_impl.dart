import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio _dio;
  ProductRepositoryImpl(this._dio);

  @override
  Future<void> deleteProduct(int id) async {
    try {
      await _dio.auth().put(
        '/products/$id',
        data: {
          'enabled': false,
        },
      );
    } on DioException catch (e, s) {
      log('Erro ao deletar produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao deletar produto');
    }
  }

  @override
  Future<List<ProductModel>> findAll(String? name) async {
    try {
      final resultProducts = await _dio.auth().get(
        '/products',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );
      return resultProducts.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final resultProducts = await _dio.auth().get(
            '/products/$id',
          );
      return ProductModel.fromMap(resultProducts.data);
    } on DioException catch (e, s) {
      log('Erro ao buscar produto $id', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produto $id');
    }
  }

  @override
  Future<void> save(ProductModel productModel) {
    // TODO: implement uploadImageProduct
    throw UnimplementedError();
    // try {
    //   final client = _dio.auth();

    //   if (model.id != null) {
    //     await client.auth().put(
    //           '/payment-types/${model.id}',
    //           data: model.toMap(),
    //         );
    //   } else {
    //     await client.auth().post(
    //           '/payment-types',
    //           data: model.toMap(),
    //         );
    //   }
    // } on DioException catch (e, s) {
    //   log('Erro ao salvar forma de pagamento', error: e, stackTrace: s);
    //   throw RepositoryException(message: 'Erro ao salvar forma de pagamento');
    // }
  }

  @override
  Future<String> uploadImageProduct(Uint8List file, String filename) {
    // TODO: implement uploadImageProduct
    throw UnimplementedError();
  }
}
