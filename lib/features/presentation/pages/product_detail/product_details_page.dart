import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/core/di/injectable.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/presentation/cubits/product_details/product_details_cubit.dart';
import 'package:tr_store/features/presentation/widgets/app_network_image.dart';
import 'package:tr_store/features/presentation/widgets/shimmer/item_details_placeholder.dart';

part 'widgets/product_details_scaffold.dart';
part 'widgets/header_image_view.dart';
part 'widgets/product_loaded_view.dart';
part 'widgets/product_details_load_failed_view.dart';

@RoutePage()
class ProductDetailsPage extends StatelessWidget {
  final int id;
  const ProductDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductDetailsCubit>()..loadProductDetails(id),
      child: _Scaffold(
        productLoadFailedView: const _ProductDetailsLoadFailedView(),
        productLoadingView: const ItemDetailsPlaceHolder(),
        productLoadedView: (ProductEntity productEntity) => _ProductLoadedView(productEntity: productEntity),
      ),
    );
  }
}
