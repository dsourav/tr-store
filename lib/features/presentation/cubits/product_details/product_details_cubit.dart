import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/usecases/product_usecases/get_one_product_usecase.dart';

part 'product_details_state.dart';

@Injectable()
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetOneProductUseCase getOneProductUseCase;
  ProductDetailsCubit(this.getOneProductUseCase) : super(ProductDetailsLoading());

  loadProductDetails(int id) async {
    final result = await getOneProductUseCase.call(ParamsGetOneProductUseCase(id: id));

    result.fold((error) {
      emit(ProductDetailsLoadingFailed());
    }, (data) {
      emit(ProductDetailsLoaded(productEntity: data));
    });
  }
}
