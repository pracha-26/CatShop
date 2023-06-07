import 'package:flutter/material.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';

//shared service
import 'package:frontcatshop/shared/service.dart';

class ShowBody extends StatefulWidget {
  static const namedRoute = "Show-Body";
  const ShowBody({Key? key}) : super(key: key);

  @override
  State<ShowBody> createState() => _ShowBodyState();
}

class _ShowBodyState extends State<ShowBody> {
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

