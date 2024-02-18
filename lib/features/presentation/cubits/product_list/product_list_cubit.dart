import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/usecases/product_usecases/get_all_product_usecase.dart';

part 'product_list_state.dart';

@Injectable()
class ProductListCubit extends Cubit<ProductListState> {
  final GetAllProductUseCase getAllProductUseCase;
  ProductListCubit(this.getAllProductUseCase) : super(ProductListLoading());

  Future<void> loadProducts() async {
    final result = await getAllProductUseCase.call(NoParams());

    result.fold((error) {
      emit(ProductListLoadingFailed());
    }, (data) {
      emit(ProductListLoaded(data));
    });
  }
}
