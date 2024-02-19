import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/core/di/injectable.dart';
import 'package:tr_store/core/routing/app_router.dart';
import 'package:tr_store/core/theme/app_theme.dart';
import 'package:tr_store/core/theme/app_theme_data.dart';
import 'package:tr_store/features/presentation/cubits/cart_count/cart_count_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(TrStoreApp());
}

class TrStoreApp extends StatelessWidget {
  TrStoreApp({super.key});
  final _lightTheme = AppLightThemeData();
  final _darkTheme = AppDarkThemeData();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<CartCountCubit>(create: (_) => getIt<CartCountCubit>()..loadCartCount())],
      child: AppTheme(
        lightTheme: _lightTheme,
        darkTheme: _darkTheme,
        child: MaterialApp.router(
          theme: _lightTheme.materialThemeData,
          darkTheme: _darkTheme.materialThemeData,
          routerConfig: getIt<AppRouter>().config(),
          title: 'TR Store',
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
