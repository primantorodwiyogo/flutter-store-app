import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_app/models/product.dart';
import 'package:http/http.dart' as http;

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoading());
      final response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      emit(ProductSuccess(product: productFromJson(response.body)));
    });
  }
}
