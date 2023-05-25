import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_app/bloc/product/product_bloc.dart';


// import '../../bloc/product/allproduct_bloc.dart';
import 'components/content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("home"),
      // ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return ContentHome(
                  product: state.product[index],
                );
              },
              itemCount: state.product.length,
            );
          }
          return const Center(
            child: Text("no data"),
          );
        },
      ),
    );
  }
}
