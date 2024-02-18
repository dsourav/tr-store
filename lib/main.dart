import 'package:flutter/material.dart';
import 'package:tr_store/core/di/injectable.dart';
import 'package:tr_store/core/routing/app_router.dart';
import 'package:tr_store/core/theme/app_theme.dart';
import 'package:tr_store/core/theme/app_theme_data.dart';

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
    return AppTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp.router(
        theme: _lightTheme.materialThemeData,
        darkTheme: _darkTheme.materialThemeData,
        routerConfig: getIt<AppRouter>().config(),
        title: 'TR Store',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
