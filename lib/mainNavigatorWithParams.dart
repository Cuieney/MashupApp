import 'package:flutter/material.dart';

class Product {
  final String title;
  final String decription;

  Product(this.title, this.decription);
}

void main() {
  runApp(MaterialApp(
    title: "navigation  with params",
    home: ProductList(proiductList: List.generate(20, (i)=>Product("the item of $i", "$i")),),

  ));
}

class ProductList extends StatelessWidget {
  final List<Product> proiductList;

  ProductList({Key key, @required this.proiductList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product List"),
      ),
      body: ListView.builder(
          itemCount: proiductList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(proiductList[index].title),
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(product:proiductList[index])));
              },
            );
          }),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key,@required this.product}):super (key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("product detail"),),
      body: Center(
        child: Text("${product.title} ${product.decription}"),
      ),
    );
  }
}
