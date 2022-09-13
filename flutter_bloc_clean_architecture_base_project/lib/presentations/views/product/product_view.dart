import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_base_project/presentations/blocs/all_blocs.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All products")),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductBloc>().add(ProductLoadStarted());
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProducstLoadScuccessState) {
              return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) => ListTile(
                          title: Text(
                        state.products[index].title,
                      )));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
