import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  List<Product> products = [
    Product(
      name: 'Product 1',
      description: 'Description of Product 1',
      imageUrl: 'assets/images/cat1.jpg',
    ),
    Product(
      name: 'Product 2',
      description: 'Description of Product 2',
      imageUrl: 'assets/images/cat2.jpg',
    ),
    Product(
      name: 'Product 3',
      description: 'Description of Product 3',
      imageUrl: 'assets/images/cat3.jpg',
    ),
    // Add more products here
  ];

  List<Product> filteredProducts = [];

  void searchProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
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
                Product product = filteredProducts[index];
                return ListTile(
                  leading: Image.asset(
                    product.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.description),
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
                    context,MaterialPageRoute(builder: (context) => ProductSearchPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                },
              ),
              SizedBox(width: 56.0),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                },
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
