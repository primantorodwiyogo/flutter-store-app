part of 'allproduct_bloc.dart';

abstract class AllproductState {}

class AllproductInitial extends AllproductState {}

class AllproductLoading extends AllproductState {}

class AllproductSuccess extends AllproductState {
  final List<AllProduct> allproduct;
  AllproductSuccess({required this.allproduct});
}
