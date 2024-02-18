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

import '../../features/data/data_sources/remote/product_remote_data_source.dart'
    as _i8;
import '../db/app_database.dart' as _i3;
import '../network/dio_client.dart' as _i9;
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
  gh.factory<_i7.NetworkInfoImpl>(
      () => _i7.NetworkInfoImpl(gh<_i6.InternetConnectionChecker>()));
  gh.factory<_i8.ProductRemoteDataSource>(
      () => _i8.ProductRemoteDataSourceImpl(gh<_i5.Dio>()));
  return getIt;
}

class _$DioClient extends _i9.DioClient {}

class _$NetworkModule extends _i7.NetworkModule {}
