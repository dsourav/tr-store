import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/exceptions.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/core/network/network_info.dart';
import 'package:tr_store/features/data/data_sources/remote/product_remote_data_source.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/repositories/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(this.productRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final result = await productRemoteDataSource.getAll();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return const Right([]);
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
      return Left(ServerFailure());
    }
  }
}
