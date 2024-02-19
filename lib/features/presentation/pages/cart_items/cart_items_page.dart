import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/core/di/injectable.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/presentation/cubits/cart_items/cart_items_cubit.dart';
import 'package:tr_store/features/presentation/widgets/app_network_image.dart';
import 'package:tr_store/features/presentation/widgets/shimmer/list_item_placeholder.dart';

part 'widgets/cart_items_scaffold.dart';
part 'widgets/cart_items_load_failed_view.dart';
part 'widgets/cart_items_view.dart';

@RoutePage()
class CartItemsPage extends StatelessWidget {
  const CartItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartItemsCubit>()..loadCartItems(),
      child: _Scaffold(
        cartListView: (items) => _CartItemsView(items),
        cartLoadFailedView: const _CardItemLoadFailedView(),
        cartLoadingView: const ListItemPlaceholder(),
      ),
    );
  }
}
