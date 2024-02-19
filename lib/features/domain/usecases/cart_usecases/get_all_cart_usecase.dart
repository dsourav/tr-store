import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/repositories/shopping_cart_repository.dart';

@Injectable()
class GetAllCartItemUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final ShoppingCartRepository shoppingCartRepository;

  GetAllCartItemUseCase(this.shoppingCartRepository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return shoppingCartRepository.getAll();
  }
}
