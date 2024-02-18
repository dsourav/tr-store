import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/errors/failures.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/repositories/product_repository.dart';

@Injectable()
class GetAllProductUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository productRepository;

  GetAllProductUseCase(this.productRepository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return productRepository.getAll();
  }
}
