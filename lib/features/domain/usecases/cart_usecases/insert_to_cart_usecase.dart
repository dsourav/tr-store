import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/repositories/shopping_cart_repository.dart';

@Injectable()
class InsertToCartUseCase implements UseCase2<Future<void>, ParamsInsertProductUseCase> {
  final ShoppingCartRepository shoppingCartRepository;

  InsertToCartUseCase(this.shoppingCartRepository);

  @override
  Either<Failure, Future<void>> call(params) {
    return shoppingCartRepository.insert(params.productEntity);
  }
}

class ParamsInsertProductUseCase extends Equatable {
  final ProductEntity productEntity;

  const ParamsInsertProductUseCase({required this.productEntity});

  @override
  List<Object> get props => [productEntity];

  @override
  String toString() => 'ParamsInsertProductUseCase(productEntity: $productEntity)';
}
