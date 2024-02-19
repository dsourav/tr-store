// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;

import '../../features/data/data_sources/local/product_local_data_source.dart'
    as _i8;
import '../../features/data/data_sources/local/shopping_cart_local_data_source.dart'
    as _i12;
import '../../features/data/data_sources/remote/product_remote_data_source.dart'
    as _i9;
import '../../features/data/repositories/product_repository_impl.dart' as _i11;
import '../../features/data/repositories/shopping_repository_impl.dart' as _i14;
import '../../features/domain/repositories/product_repository.dart' as _i10;
import '../../features/domain/repositories/shopping_cart_repository.dart'
    as _i13;
import '../../features/domain/usecases/cart_usecases/get_all_cart_usecase.dart'
    as _i15;
import '../../features/domain/usecases/cart_usecases/get_cart_count_usecase.dart'
    as _i17;
import '../../features/domain/usecases/cart_usecases/insert_to_cart_usecase.dart'
    as _i19;
import '../../features/domain/usecases/product_usecases/get_all_product_usecase.dart'
    as _i16;
import '../../features/domain/usecases/product_usecases/get_one_product_usecase.dart'
    as _i18;
import '../../features/presentation/cubits/cart_count/cart_count_cubit.dart'
    as _i22;
import '../../features/presentation/cubits/cart_items/cart_items_cubit.dart'
    as _i23;
import '../../features/presentation/cubits/product_details/product_details_cubit.dart'
    as _i20;
import '../../features/presentation/cubits/product_list/product_list_cubit.dart'
    as _i21;
import '../db/app_database.dart' as _i3;
import '../network/dio_client.dart' as _i24;
import '../network/network_info.dart' as _i7;
import '../routing/app_router.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioClient = _$DioClient();
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.AppDatabase>(_i3.AppDatabase());
  gh.singleton<_i4.AppRouter>(_i4.AppRouter());
  gh.singleton<_i5.Dio>(dioClient.dio());
  gh.factory<_i6.InternetConnectionChecker>(
      () => networkModule.checkConnection());
  gh.factory<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(gh<_i6.InternetConnectionChecker>()));
  gh.factory<_i8.ProductLocalDataSource>(
      () => _i8.ProductLocalDataSourceImpl(gh<_i3.AppDatabase>()));
  gh.factory<_i9.ProductRemoteDataSource>(
      () => _i9.ProductRemoteDataSourceImpl(gh<_i5.Dio>()));
  gh.factory<_i10.ProductRepository>(() => _i11.ProductRepositoryImpl(
        gh<_i9.ProductRemoteDataSource>(),
        gh<_i7.NetworkInfo>(),
        gh<_i8.ProductLocalDataSource>(),
      ));
  gh.factory<_i12.ShoppingCartLocalDataSource>(
      () => _i12.ShoppingCartLocalDataSourceImpl(gh<_i3.AppDatabase>()));
  gh.factory<_i13.ShoppingCartRepository>(() =>
      _i14.ShoppingCartRepositoryImpl(gh<_i12.ShoppingCartLocalDataSource>()));
  gh.factory<_i15.GetAllCartItemUseCase>(
      () => _i15.GetAllCartItemUseCase(gh<_i13.ShoppingCartRepository>()));
  gh.factory<_i16.GetAllProductUseCase>(
      () => _i16.GetAllProductUseCase(gh<_i10.ProductRepository>()));
  gh.factory<_i17.GetCartItemCountUseCase>(
      () => _i17.GetCartItemCountUseCase(gh<_i13.ShoppingCartRepository>()));
  gh.factory<_i18.GetOneProductUseCase>(
      () => _i18.GetOneProductUseCase(gh<_i10.ProductRepository>()));
  gh.factory<_i19.InsertToCartUseCase>(
      () => _i19.InsertToCartUseCase(gh<_i13.ShoppingCartRepository>()));
  gh.factory<_i20.ProductDetailsCubit>(
      () => _i20.ProductDetailsCubit(gh<_i18.GetOneProductUseCase>()));
  gh.factory<_i21.ProductListCubit>(
      () => _i21.ProductListCubit(gh<_i16.GetAllProductUseCase>()));
  gh.factory<_i22.CartCountCubit>(
      () => _i22.CartCountCubit(gh<_i17.GetCartItemCountUseCase>()));
  gh.factory<_i23.CartItemsCubit>(() => _i23.CartItemsCubit(
        gh<_i15.GetAllCartItemUseCase>(),
        gh<_i19.InsertToCartUseCase>(),
      ));
  return getIt;
}

class _$DioClient extends _i24.DioClient {}

class _$NetworkModule extends _i7.NetworkModule {}
