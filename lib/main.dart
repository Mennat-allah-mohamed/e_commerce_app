import 'package:e_commerce_app/screens/main_screen.dart';
import 'package:e_commerce_app/screens/onboarding_screen.dart';
import 'package:e_commerce_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/product_bloc.dart';
import 'bloc/product_event.dart';
import 'cubit/cart_cubit.dart';
import 'cubit/favorites_cubit.dart';
import 'data/service/product_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(MyApp(sharedPrefs: sharedPrefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPrefs;

  const MyApp({super.key, required this.sharedPrefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(ProductService())..add(FetchProducts()),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Cyber Linio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const OnboardingScreen(),
          '/main': (context) => const MainScreen(),
          '/product-detail': (context) => const ProductDetailScreen(),
        },
      ),
    );
  }
}