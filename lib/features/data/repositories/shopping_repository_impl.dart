import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/exceptions.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/features/data/data_sources/local/shopping_cart_local_data_source.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/repositories/shopping_cart_repository.dart';

@Injectable(as: ShoppingCartRepository)
class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final ShoppingCartLocalDataSource shoppingCartLocalDataSource;

  ShoppingCartRepositoryImpl(this.shoppingCartLocalDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    try {
      final data = await shoppingCartLocalDataSource.getAll();
      final allItems = data
          .map((item) =>
              ProductEntity(userId: item.uid, content: "", title: item.title, thumbnail: item.thumbnail, image: ""))
          .toList();
      return Right(allItems);
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Either<Failure, Stream<int?>?> getCount() {
    try {
      return Right(shoppingCartLocalDataSource.getCartItemCount());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Either<Failure, Future<void>> insert(ProductEntity productEntity) {
    try {
      return Right(shoppingCartLocalDataSource.insert(productEntity));
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }
}
