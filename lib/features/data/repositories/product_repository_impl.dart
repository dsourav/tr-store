import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/exceptions.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/core/network/network_info.dart';
import 'package:tr_store/features/data/data_sources/local/product_local_data_source.dart';
import 'package:tr_store/features/data/data_sources/remote/product_remote_data_source.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/repositories/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(this.productRemoteDataSource, this.networkInfo, this.productLocalDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final result = await productRemoteDataSource.getAll();
        productLocalDataSource.upsertProducts(result);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await productLocalDataSource.getAll();

        final items = result
            .map(
              (p) => ProductEntity(
                  userId: p.id, content: p.content, title: p.title, thumbnail: p.thumbnail, image: p.image),
            )
            .toList();

        if (items.isEmpty) return Left(CacheFailure());

        return Right(items);
      } on DatabaseException {
        return Left(DatabaseFailure());
      }
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getOne(int id) async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final result = await productRemoteDataSource.getOne(id);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final data = await productLocalDataSource.getOne(id).getSingle();

        return Right(ProductEntity(
            userId: data.id, title: data.title, content: data.content, image: data.image, thumbnail: data.thumbnail));
      } on DatabaseException {
        return Left(DatabaseFailure());
      }
    }
  }
}
