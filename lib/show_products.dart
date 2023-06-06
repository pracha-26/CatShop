import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';
import 'package:frontcatshop/shared/service.dart';
class ProductsList extends StatefulWidget {
 const ProductsList({Key? key}) : super(key: key);

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
      body: FutureBuilder<List<Products>?>(
        future: ApiProducts().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<Products> products = snapshot.data!;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Products product = products[index];
                  return ListView.builder(
                    itemCount: product.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      var attributes = product.data[i].attributes;
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Image.network(
                            Shared.baseUrl + '${attributes.pImage.data.attributes.url}',
                            width: 50,
                            height: 50,
                          ),
                          title: Text(attributes.pName),
                          subtitle: Text(attributes.pDescription),
                          trailing: Text(
                            '\$${attributes.pPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            // TODO: Handle item tap
                          },
                        ),
                      );
                    },
                  );
                },
              );


            // return ListView.builder(
            //   itemCount: products.length,
            //   itemBuilder: (context, index) {
            //     Products product = products[index];
            //     return ListTile(
            //       title: Text(product.data[index].attributes.pName),
            //       subtitle: Text('Price: \$${product.data[index].attributes.pDescription}'),
            //     );
            //   },
            // );


          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}

