import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/allproduct.dart';

part 'allproduct_event.dart';
part 'allproduct_state.dart';

class AllproductBloc extends Bloc<AllproductEvent, AllproductState> {
  AllproductBloc() : super(AllproductInitial()) {
    on<AllproductEvent>((event, emit) async {
      emit(AllproductLoading());
      final response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      emit(AllproductSuccess(allproduct: allProductFromJson(response.body)));
    });
  }
}
