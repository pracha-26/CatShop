import 'package:flutter/material.dart';
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';
import 'package:frontcatshop/shared/service.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  late Future<List<Products>?> futureAlbum;
  List<Products> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiProducts().getProducts();
  }

  void searchProducts(String query) {
    setState(() {
      filteredProducts = [];
      futureAlbum.then((products) {
        for (var product in products!) {
          for (var data in product.data) {
            if (data.attributes.pName.toLowerCase().contains(query.toLowerCase())) {
              filteredProducts.add(product);
              break;
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              onChanged: searchProducts,
              decoration: InputDecoration(
                hintText: 'Search products',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (BuildContext context, int index) {
                Products product = filteredProducts[index];
                return ListTile(
                  leading: Image.network(
                    Shared.baseUrl + '${product.data[0].attributes.pImage.data.attributes.url}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.data[0].attributes.pName),
                  subtitle: Text(product.data[0].attributes.pPrice.toString()),
                  onTap: () {
                    // Handle product selection
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.search_sharp),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductSearchPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {},
              ),
              SizedBox(width: 56.0),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
          // Handle FloatingActionButton press
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
