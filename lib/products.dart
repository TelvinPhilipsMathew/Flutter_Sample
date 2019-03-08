import 'package:flutter/material.dart';

import './pages/product.dart';

class Products extends StatelessWidget {
  List<Map<String, dynamic>> products;
  Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products[index]['title'],
                    style: TextStyle(fontFamily: 'Oswald', fontSize: 26.0),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 6.0),
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      '\$ ${products[index]['price'].toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )

                ],
              )),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((value) {
                      if (value) {
                        deleteProduct(index);
                      }
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: products.length,
          )
        : Center(
            child: Text('No Products found.'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
