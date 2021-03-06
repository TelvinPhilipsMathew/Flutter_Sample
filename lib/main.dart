import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/products.dart';
import './pages/product_admin.dart';
import './pages/product.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }
  void _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.white,
          brightness: Brightness.light),
      routes: {
        '/': (context) => AuthPage(),
        '/products': (context) => ProductsPage(_products, _addProduct, _deleteProduct),
        '/admin': (context) => ProductAdminPage(_addProduct)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> namedPath = settings.name.split('/');
        if (namedPath[0] != '') {
          return null;
        }
        if (namedPath[1] == 'product') {
          final int index = int.parse(namedPath[2]);
          return MaterialPageRoute<bool>(
              builder: (context) =>
                  ProductPage(
                      _products[index]['title'], _products[index]['image']));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (context) =>
          AuthPage()
        );
      },
    );
  }
}
