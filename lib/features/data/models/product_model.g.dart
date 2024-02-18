// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      userId: json['userId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
    };
