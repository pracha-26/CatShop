import 'package:flutter/material.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';
import 'package:frontcatshop/home.dart';

//shared service
import 'package:frontcatshop/shared/service.dart';

class cat_Products {
  final String name;
  final String description;
  final int price;
  final String imageUrl;

  cat_Products({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  late Future<List<Products>?> futureAlbum;
  List<cat_Products> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiProducts().getProducts();
  }

  void searchProducts(String query) {
    setState(() {
      futureAlbum.then((products) {
        filteredProducts = []; // ล้างรายการสินค้าที่ผ่านการค้นหาก่อนที่จะเริ่มค้นหาใหม่
        for (var product in products!) {
          for (var data in product.data) {
            if (data.attributes.pName.toLowerCase().contains(query.toLowerCase())) {
              filteredProducts.add(
                cat_Products(
                  name: data.attributes.pName,
                  description: data.attributes.pDescription,
                  price: data.attributes.pPrice,
                  imageUrl: data.attributes.pImage.data.attributes.url,
                ),
              );
              // break;
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
              itemBuilder: (context, index) {
                cat_Products product = filteredProducts[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Image.network(
                      Shared.baseUrl + product.imageUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: Text(
                      '\$${product.price.toStringAsFixed(2)}',
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
          // Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
