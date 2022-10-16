import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_base_project/configs/theme/dark_theme.dart';
import 'package:flutter_bloc_clean_architecture_base_project/configs/theme/light_theme.dart';
import 'package:flutter_bloc_clean_architecture_base_project/presentations/blocs/products/products_bloc.dart';
import 'package:flutter_bloc_clean_architecture_base_project/presentations/views/views.dart'
    show ProductsView;

import 'dependency_injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          // create: (_) => ProductBloc(const GetAllProductsUseCase(
          //     ProductRepositoryImpl(
          //         productRemoteDataSource: ProductRemoteDataSourceImp()))),
           create: (_) => di.injector<ProductBloc>()..add(ProductLoadStarted()),
        ),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        darkTheme: DarkThme().getTheme(),
        theme: LightTheme().getTheme(),
        home: const ProductsView(),
      ),
    );
  }
}
