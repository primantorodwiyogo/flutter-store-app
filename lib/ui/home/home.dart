import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/allproduct_bloc.dart';
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
      body: BlocBuilder<AllproductBloc, AllproductState>(
        builder: (context, state) {
          if (state is AllproductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AllproductSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return ContentHome(
                  allproduct: state.allproduct[index],
                );
              },
              itemCount: state.allproduct.length,
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
