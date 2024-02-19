import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/db/app_database.dart';
import 'package:tr_store/core/errors/exceptions.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';

abstract class ShoppingCartLocalDataSource {
  Stream<int?>? getCartItemCount();
  Future<List<CartItem>> getAll();
  Future<void> insert(ProductEntity productEntity);
}

@Injectable(as: ShoppingCartLocalDataSource)
class ShoppingCartLocalDataSourceImpl implements ShoppingCartLocalDataSource {
  final AppDatabase appDatabase;

  ShoppingCartLocalDataSourceImpl(this.appDatabase);

  @override
  Stream<int?>? getCartItemCount() {
    try {
      final countExpr = appDatabase.cartItems.id.count();

      final query = appDatabase.selectOnly(appDatabase.cartItems)..addColumns([countExpr]);

      return query.map((row) => row.read(countExpr)).watchSingle();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<CartItem>> getAll() {
    try {
      return appDatabase.select(appDatabase.cartItems).get();
    } catch (_) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> insert(ProductEntity productEntity) async {
    await appDatabase.into(appDatabase.cartItems).insert(CartItemsCompanion(
        thumbnail: Value(productEntity.thumbnail),
        title: Value(productEntity.title),
        uid: Value(productEntity.userId)));
  }
}
