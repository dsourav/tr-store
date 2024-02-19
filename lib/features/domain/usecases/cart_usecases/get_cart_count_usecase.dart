import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/repositories/shopping_cart_repository.dart';

@Injectable()
class GetCartItemCountUseCase implements UseCase2<Stream<int?>?, NoParams> {
  final ShoppingCartRepository shoppingCartRepository;

  GetCartItemCountUseCase(this.shoppingCartRepository);
  @override
  Either<Failure, Stream<int?>?> call(NoParams params) {
    return shoppingCartRepository.getCount();
  }
}
