import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/core/di/injectable.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/presentation/cubits/product_list/product_list_cubit.dart';
import 'package:tr_store/features/presentation/widgets/app_network_image.dart';
import 'package:tr_store/features/presentation/widgets/shimmer/list_tile_shimmer.dart';

part 'widgets/product_list_scaffold.dart';
part 'widgets/product_load_failed_view.dart';
part 'widgets/product_list_view.dart';

@RoutePage()
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductListCubit>(),
      child: _Scaffold(
        productLoadFailedView: const _ProductLoadFailedView(),
        productLoadingView: const ListTileShimmer(),
        productListView: (products) => _ProductListView(products),
      ),
    );
  }
}
