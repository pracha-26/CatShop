import 'package:flutter/material.dart';
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';
class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late Future<List<Products>?> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiProducts().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];

          return Card(
            child: ListTile(
              leading: Image.network('https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&quality=85&auto=format&fit=max&s=a52bbe202f57ac0f5ff7f47166906403',
                width: 50,
                height: 50,
              ),
              title: Text(product.name),
              subtitle: Text(product.description),
              trailing: Text('\$${product.price.toStringAsFixed(2)}'),
              onTap: () {
                // TODO: Handle item tap
              },
            ),
          );
        },
      ),
    );
  }
}


class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

final productList = [
  Product(
    name: 'Product 1',
    description: 'Description of Product 1',
    imageUrl: '../image/cat2.jpg',
    price: 19.99,
  ),
  Product(
    name: 'Product 2',
    description: 'Description of Product 2',
    imageUrl: '../image/cat2.jpg',
    price: 29.99,
  ),
];
