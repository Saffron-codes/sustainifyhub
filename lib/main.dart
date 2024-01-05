import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustainify_hub/providers/products_provider.dart';
import 'package:sustainify_hub/views/main_view.dart';
import 'package:sustainify_hub/views/surplus_products_buy_view.dart';
import 'package:sustainify_hub/views/surplus_products_sell_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProductsProvider()),
      ],
      child: MaterialApp(
        title: 'Sustainify Hub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          primarySwatch: Colors.green,
          // useMaterial3: true,
        ),
        // home: MainView(),
        initialRoute: '/',
        routes: {
          '/': (_) => MainView(),
          '/surplus/buy': (_) => SurplusProductsBuyView(),
          '/surplus/sell': (_) => SurplusProductsSellView(),
        },
      ),
    );
  }
}
