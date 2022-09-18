// To parse this JSON data, do
//
//     final catalog = catalogFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_model.freezed.dart';
part 'catalog_model.g.dart';

@freezed
class CatalogModel with _$CatalogModel {
  const factory CatalogModel({
    @Default([]) List<Product> products,
    @Default(0) int total,
    @Default(0) int skip,
    @Default(0) int limit,
  }) = _Catalog;

  factory CatalogModel.fromJson(Map<String, dynamic> json) => _$CatalogModelFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @Default(0) int price,
    @Default(0.0) double discountPercentage,
    @Default(0.0) double rating,
    @Default(0) int stock,
    @Default('') String brand,
    @Default('') String category,
    @Default('') String thumbnail,
    @Default([]) List<String> images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
