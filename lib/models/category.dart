import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_store_app/models/product.dart';

@immutable
class ProductCategory extends Equatable {
  ProductCategories categories;
  bool isSelected;

  @override
  List<Object?> get props => [categories, isSelected];

  ProductCategory copyWith({ProductCategories? categories, bool? isSelected}) {
    return ProductCategory(
        categories: categories ?? this.categories,
        isSelected: isSelected ?? this.isSelected);
  }

  ProductCategory({required this.categories, required this.isSelected});

  @override
  String toString() {
    return '\nProductCategory{categories: $categories, isSelected:$isSelected}';
  }
}
