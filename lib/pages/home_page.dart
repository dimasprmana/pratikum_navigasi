import 'package:flutter/material.dart';
import 'package:navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Sabun',
        price: 30000,
        imageUrl: 'https://down-id.img.susercontent.com/file/id-11134201-7r98o-lukhohp17gan54',
        stock: 20,
        rating: 8.5,
      ),
      Item(
        name: 'Sampo',
        price: 15000,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZeHPooeJkA4X9bvISt9L9ESGJBWMqfvXWKw&s',
        stock: 15,
        rating: 7.5,
      ),
      Item(
        name: 'Sikat Gigi',
        price: 15000,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWai3arlWX1coz1zIpCKyOEtntsZZ91zgDsw&s',
        stock: 20,
        rating: 8.5,
      ),
      Item(
        name: 'Pasta Gigi',
        price: 17000,
        imageUrl: 'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/3/9/4889f362-5cc7-4bcc-a1dc-8f7df2933d0c.jpg',
        stock: 15,
        rating: 8.5,
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("List Barang"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom
            childAspectRatio: 0.7, // Rasio lebar terhadap tinggi
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