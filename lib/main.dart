import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final int indexNumber = 212047;


  final List<Map<String, dynamic>> products = [
    {
      'name': 'T-Shirt',
      'image': 'https://www.sheezicknareezick.com/image/cache/data/ProductsNEW/Women/flat/jellystar-womentee-1web-800x1067.jpg',
      'description': 'Розе маичка',
      'price': 899,
    },
    {
      'name': 'Jeans',
      'image': 'https://found.store/cdn/shop/files/baggy-jeans-blue-lacy-found-2-1.jpg?v=1714676802&width=800',
      'description': 'Широки долги фармерки',
      'price': 1800,
    },
    {
      'name': 'Leather Jacket',
      'image': 'https://www.thejacketmaker.ae/cdn/shop/files/Men_s_Lavendard_Brown_Leather_Biker_Jacket-2_746fba86-1fbc-43f9-a9d5-1e400876d80d_900x.jpg?v=1719233597',
      'description': 'Кожна јакна',
      'price': 2750,
    },
    {
      'name': 'Sneakers',
      'image': 'https://stevemadden.co.za/cdn/shop/files/STEVEMADDEN_SHOES_POSSESSION-E_BLACK_grande.jpg?v=1706089675',
      'description': 'Црни патики Steve Madden',
      'price': 2000,
    },
    {
      'name': 'Hoodie',
      'image': 'https://perplex.store/cdn/shop/files/1000084-ArmorHoodieBlack_01_bf22178f-324e-437f-af68-be4edd1f4a29.jpg?v=1728915678&width=900',
      'description': 'Црн дуксер',
      'price': 1550,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index: $indexNumber'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(product['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(product['name']),
              subtitle: Text('${product['price']} ден.'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: product),
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

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(product['image']),
                    fit: BoxFit.cover,
                  ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              product['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              'Price: ${product['price']} ден.',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}