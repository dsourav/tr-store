import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/repositories/product_repository.dart';

@Injectable()
class GetOneProductUseCase implements UseCase<ProductEntity, ParamsGetOneProductUseCase> {
  final ProductRepository productRepository;

  GetOneProductUseCase(this.productRepository);
  @override
  Future<Either<Failure, ProductEntity>> call(ParamsGetOneProductUseCase params) {
    return productRepository.getOne(params.id);
  }
}

class ParamsGetOneProductUseCase extends Equatable {
  final int id;

  const ParamsGetOneProductUseCase({required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ParamsGetOneProductUseCase(id: $id)';
}
