import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_app/bloc/product/product_bloc.dart';
import 'package:flutter_store_app/models/product.dart';
import 'package:http/http.dart' as http;

// import '../../models/allproduct.dart';
// import '../bloc/product/allproduct_bloc.dart';

// part 'allproduct_event.dart';
// part 'allproduct_state.dart';

class AllproductBloc extends Bloc<ProductEvent, ProductState> {
  AllproductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoading());
      final response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      emit(ProductSuccess(product: productFromJson(response.body)));
    });
  }
}
