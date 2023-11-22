import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:poke_co/models/character.dart';
import 'package:poke_co/screens/login.dart';
import 'package:poke_co/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Future<List<Character>> fetchItem() async {
      final request = context.read<CookieRequest>();
      final username = LoginPage.uname;
      
      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
      var url = Uri.parse(
          'https://fadhil-muhammad23-tugas.pbp.cs.ui.ac.id/json-user/$username/');
      var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object Character
      List<Character> list_product = [];
      for (var d in data) {
          if (d != null) {
              list_product.add(Character.fromJson(d));
          }
      }
      return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Character'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("Amount: ${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text("Rarity: ${snapshot.data![index].fields.rarity}"),
                                    const SizedBox(height: 10),
                                    Text("Power: ${snapshot.data![index].fields.power}"),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.description}"),
                                    const SizedBox(height: 10),
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}