import 'package:flutter/material.dart';
import 'package:smart_mobile/screens/menu.dart';
import 'package:smart_mobile/screens/smart_mobile_form.dart';
import 'package:smart_mobile/screens/lihat_item.dart';
import 'package:smart_mobile/screens/list_product.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'SMart = Sita Mart',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat seluruh stok tokomu disini!",
                  style:  TextStyle(
                    fontSize: 15,
                    color:  Colors.white,
                    fontWeight:  FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.checklist),
          //   title: const Text('Lihat Semua Produk'),
          //   // Bagian redirection ke ShopFormPage
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const LihatItem(),
          //         ));
          //   },
          // ),
          ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Daftar Produk'),
              onTap: () {
                  // Route menu ke halaman produk
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}