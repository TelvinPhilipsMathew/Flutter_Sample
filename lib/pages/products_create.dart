import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return ProductCreateState();
  }
}

class ProductCreateState extends State<ProductCreatePage> {
  String title;
  String description;
  double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(labelText: 'Product Title'),
            keyboardType: TextInputType.text,
          ),
          TextField(
            onChanged: (value) {
              description = value;
            },
            decoration: InputDecoration(labelText: 'Product Description'),
            keyboardType: TextInputType.text,
            maxLines: 4,
          ),
          TextField(
            onChanged: (value) {
              price = double.parse(value);
            },
            decoration: InputDecoration(labelText: 'Product Price'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            color: Colors.amberAccent,
            textColor: Colors.white,
            child: Text('Save'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': title,
                'description': description,
                'price': price,
                'image': 'assets/food.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, "/products");
            },
          )
        ],
      ),
    );
  }
}
