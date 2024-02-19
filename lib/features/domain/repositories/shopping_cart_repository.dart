import 'package:dartz/dartz.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';

abstract class ShoppingCartRepository {
  Future<Either<Failure, List<ProductEntity>>> getAll();
  Either<Failure, Stream<int?>?> getCount();
  Either<Failure, Future<void>> insert(ProductEntity productEntity);
}
