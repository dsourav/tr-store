import 'package:json_annotation/json_annotation.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.userId,
      required super.title,
      required super.content,
      required super.image,
      required super.thumbnail});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
