import 'package:flutter/material.dart';
import 'package:frontcatshop/database/products/productsId_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';
import 'package:frontcatshop/shared/service.dart';

class ProductDetail extends StatefulWidget {
  final product_id;

  const ProductDetail({Key? key, required this.product_id}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Future<ProductsId?> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiProducts().getProductsID(widget.product_id);
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      // ทำอะไรสำหรับหน้าแรกของ BottomNavigationBar
    } else if (index == 1) {
      // ทำอะไรสำหรับหน้าสองของ BottomNavigationBar (เพิ่มสินค้าลงในรถเข็น)
    } else if (index == 2) {
      // ทำอะไรสำหรับหน้าสามของ BottomNavigationBar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: FutureBuilder<ProductsId?>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            ProductsId products = snapshot.data!;
            ProductsId product = products;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    Shared.baseUrl +
                        '${product.data.attributes.pImage.data.attributes.url}',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.data.attributes.pName,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product.data.attributes.pDescription,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price: \$${product.data.attributes.pPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('No data available');
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
