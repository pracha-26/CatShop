import 'package:flutter/material.dart';
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';
import 'package:frontcatshop/shared/service.dart';
import 'package:frontcatshop/show_product.dart';

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
        future: futureAlbum,
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
                    var id = product.data[i].id;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(product_id: id),
                          ),
                        );
                      },
                      child: Card(
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
                        ),
                      ),
                    );
                  },
                );
              },
            );
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
