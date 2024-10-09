import 'package:flutter/material.dart';
import 'package:navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Lego',
        price: 30000,
        imageUrl: 'https://www.lego.com/cdn/cs/set/assets/blt0254ea3dce736ea0/10305.png',
        stock: 20,
        rating: 8.5,
      ),
      Item(
        name: 'Hotwheels',
        price: 35000,
        imageUrl: 'https://img.ws.mms.shopee.co.id/id-11134207-7r98x-luoo568rwp6y54',
        stock: 15,
        rating: 7.5,
      ),
      Item(
        name: 'Robot Transformer',
        price: 25000,
        imageUrl: 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/3/3/3762e67a-0e7d-4267-a98e-f73c62e4b4b4.png',
        stock: 20,
        rating: 8.5,
      ),
      Item(
        name: 'Mobil Remot',
        price: 20000,
        imageUrl: 'https://images.tokopedia.net/img/JFrBQq/2022/5/11/aed35318-6f1f-48c2-aca2-85d40ef54df6.jpg',
        stock: 15,
        rating: 8.5,
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("List Mainan Anak-Anak"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.7, 
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Hero(
                tag: item.name, // Tag yang unik untuk animasi Hero
                child: Card(
                  child: Column(
                    children: [
                      Expanded( // Menggunakan Expanded agar gambar mengambil ruang yang tepat
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0), // Memberikan padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4), // Jarak antara nama dan harga
                            Text('Rp ${item.price}', style: TextStyle(color: Colors.green)),
                            SizedBox(height: 4), // Jarak antara harga dan stok
                            Text('Stock: ${item.stock}'),
                            SizedBox(height: 4), // Jarak antara stok dan rating
                            Text('Rating: ${item.rating}', style: TextStyle(color: Colors.orange)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Tambahkan footer jika perlu
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(16),
            child: Text('Nama:Dimas Permana, NIM: 362358302004'),
            ), 
        );
    }
}