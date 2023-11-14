import 'package:flutter/material.dart';
import 'package:poke_co/models/character.dart'; 
import 'package:poke_co/widgets/left_drawer.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Koleksi'),
        backgroundColor: Color.fromARGB(221, 252, 3, 3),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: Character.listItem.length,
        itemBuilder: (context, index) {
          Character currentItem = Character.listItem[index];
          return ListTile(
            title: Text(currentItem.name),
            subtitle: Text(
                  'Jumlah: ${currentItem.amount}\nDeskripsi: ${currentItem.description}\nRarity: ${currentItem.rarity}\nPower: ${currentItem.power}'
                ),
            isThreeLine: true,
            onTap: () {
              // Implementasi logika untuk menangani ketika item di-tap
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Detail Item'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama: ${currentItem.name}'),
                          Text('Jumlah Item: ${currentItem.amount}'),
                          Text('Deskripsi: ${currentItem.description}'),
                          Text('Rarity: ${currentItem.rarity}'),
                          Text('Power: ${currentItem.power}'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}