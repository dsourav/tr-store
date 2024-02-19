import 'package:drift/drift.dart';

class ProductItems extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get image => text()();
  TextColumn get thumbnail => text()();
  @override
  Set<Column> get primaryKey => {id};
}

class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get thumbnail => text()();
  TextColumn get title => text()();
  IntColumn get uid => integer()();
}
