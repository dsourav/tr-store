import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/features/presentation/pages/product_list/product_list_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: ProductListRoute.page),
  ];
}
