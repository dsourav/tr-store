import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:tr_store/core/di/injectable.dart';
import 'package:tr_store/core/routing/app_router.dart';

import 'package:tr_store/features/presentation/cubits/cart_count/cart_count_cubit.dart';

class CartItemCountView extends StatelessWidget {
  const CartItemCountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 0),
        badgeContent: BlocBuilder<CartCountCubit, CartCountState>(builder: (context, state) {
          if (state is CartCountLoaded) {
            return Text(state.count.toString());
          }
          return const SizedBox();
        }),
        child: IconButton(
          onPressed: () {
            final router = getIt<AppRouter>();
            router.push(const CartItemsRoute());
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
