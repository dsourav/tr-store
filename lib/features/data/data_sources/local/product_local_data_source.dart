import 'dart:developer';

import 'package:drift/drift.dart';

import 'package:injectable/injectable.dart';
import 'package:tr_store/core/db/app_database.dart';
import 'package:tr_store/core/errors/exceptions.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductItem>> getAll();
  SingleSelectable<ProductItem> getOne(int id);
  Future<void> upsertProducts(List<ProductEntity> products);
}

@Injectable(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final AppDatabase appDatabase;

  ProductLocalDataSourceImpl(this.appDatabase);

  @override
  Future<List<ProductItem>> getAll() {
    try {
      return appDatabase.select(appDatabase.productItems).get();
    } catch (_) {
      throw DatabaseException();
    }
  }

  @override
  SingleSelectable<ProductItem> getOne(int id) {
    try {
      return appDatabase.select(appDatabase.productItems)..where((tbl) => tbl.id.equals(id));
    } catch (_) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> upsertProducts(List<ProductEntity> products) async {
    try {
      final productList = products
          .map((p) =>
              ProductItem(id: p.userId, content: p.content, title: p.title, thumbnail: p.thumbnail, image: p.image))
          .toList();
      await appDatabase.batch((batch) {
        batch.insertAllOnConflictUpdate(appDatabase.productItems, productList);
      });
    } catch (_) {}
  }
}
