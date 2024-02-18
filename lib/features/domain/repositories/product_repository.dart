import 'package:dartz/dartz.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAll();
  Future<Either<Failure, ProductEntity>> getOne(int id);
}
