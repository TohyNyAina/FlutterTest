import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Pixel', description: 'Pixel is the most featureful phone ever', price: 800, color: Colors.blue),
    Product(name: 'Laptop', description: 'Laptop is most productive development tool', price: 2000, color: Colors.green),
    Product(name: 'Tablet', description: 'Tablet is the most useful device ever for meeting', price: 1500, color: Colors.yellow),
    Product(name: 'Pendrive', description: 'iPhone is the stylist phone ever', price: 100, color: Colors.red),
    Product(name: 'Floppy Drive', description: 'iPhone is the stylist phone ever', price: 50, color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Navigation'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Container(
                width: 100,
                height: 100,
                color: product.color,
                child: Center(
                  child: Text(
                    product.name.toLowerCase(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              title: Text(product.name),
              subtitle: Text('${product.description}\nPrice: ${product.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  return Icon(Icons.star_border);
                }),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                product.name.toLowerCase(),
                style: TextStyle(fontSize: 40, color: product.color),
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(product.description),
            SizedBox(height: 10),
            Text('Price: ${product.price}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(3, (index) {
                return Icon(Icons.star_border);
              }),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Write a comment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Comment'),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final Color color;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });
}
