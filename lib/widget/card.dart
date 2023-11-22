import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_mobile/screens/menu.dart';
import 'package:smart_mobile/screens/smart_mobile_form.dart';
import 'package:smart_mobile/screens/lihat_item.dart';
import 'package:smart_mobile/screens/list_product.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:smart_mobile/screens/login.dart';

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  Color getButtonColor(ShopItem item) {
    if (item.name == "Lihat Item") {
      return Color.fromARGB(255, 3, 11, 121); // Ubah warna sesuai kebutuhan
    } else if (item.name == "Tambah Item") {
      return Color.fromARGB(255, 211, 6, 143); // Ubah warna sesuai kebutuhan
    } else if (item.name == "Logout") {
      return Color.fromARGB(255, 216, 5, 5); // Ubah warna sesuai kebutuhan
    } else {
      return Colors.indigo; // Warna default
    }
  }



  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: getButtonColor(item), // Gunakan warna sesuai nama tombol
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
          // if (item.name == "Lihat Item") {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => LihatItem()));
          // }
          else if (item.name == "Lihat Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "https://syifa-kaffa-tugas.pbp.cs.ui.ac.id/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}