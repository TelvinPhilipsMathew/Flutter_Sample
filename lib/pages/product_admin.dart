import 'package:flutter/material.dart';

import './products.dart';
import './products_create.dart';
import './products_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;

  ProductAdminPage(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
                child: Column(
              children: <Widget>[
                AppBar(title: Text('Choose'),
                automaticallyImplyLeading: false,),
                ListTile(
                  title: Text('All Products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context,"/products");
                  },
                )
              ],
            )),
            appBar: AppBar(
              title: Text('Product Manager'),
              bottom: TabBar(tabs: <Widget>[
                Tab(
                  text: 'Create',
                  icon: Icon(Icons.create),
                ),
                Tab(
                  text: 'List',
                  icon: Icon(Icons.list),
                )
              ]),
            ),
            body: TabBarView(
                children: <Widget>[ProductCreatePage(addProduct), ProductListPage()])));
  }
}
