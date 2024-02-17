import 'package:drift/drift.dart';

class ProductItems extends Table {
  IntColumn get id => integer().unique()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get image => text()();
  TextColumn get thumbnail => text()();
}

class CartItems extends Table {
  IntColumn get id => integer().unique()();
  TextColumn get thumbnail => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
}
