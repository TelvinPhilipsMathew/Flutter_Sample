import 'package:flutter/material.dart';

import './product_admin.dart';
import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  List<Map<String, dynamic>> products;

  Function _addProduct;
  Function _deleteProduct;

  ProductsPage(this.products, this._addProduct, this._deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Choose'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text('Products Manager'),
              onTap: () {
                Navigator.pushReplacementNamed(context,'/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: ProductManager(products, _addProduct, _deleteProduct),
    );
  }
}
