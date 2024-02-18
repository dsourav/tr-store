import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/exceptions.dart';
import 'package:tr_store/features/data/models/product_model.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getAll();
  Future<ProductEntity> getOne(int id);
}

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSourceImpl(Dio dio) : _dio = dio;

  @override
  Future<List<ProductEntity>> getAll() async {
    try {
      final response = await _dio.get("posts");

      if (response.statusCode == 200) {
        List<ProductEntity> products =
            (response.data as List).map((productJson) => ProductModel.fromJson(productJson)).toList();
        return products;
      }
    } catch (_) {}
    throw ServerException();
  }

  @override
  Future<ProductEntity> getOne(int id) async {
    try {
      final response = await _dio.get("posts", queryParameters: {"id": id});
      final data = response.data as List;
      if (response.statusCode == 200 && data.isNotEmpty) {
        ProductEntity product = ProductModel.fromJson(data.first);
        return product;
      }
    } catch (_) {}
    throw ServerException();
  }
}
