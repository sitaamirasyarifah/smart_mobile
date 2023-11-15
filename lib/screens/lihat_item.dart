import 'package:flutter/material.dart';
import 'package:smart_mobile/widget/card.dart';
import 'package:smart_mobile/widget/model.dart';
import 'package:smart_mobile/main.dart';
import 'package:smart_mobile/widget/left_drawer.dart';



class LihatItem extends StatelessWidget {
  const LihatItem({Key? key}) : super(key: key);
  Card buildBarangCard(Barang barang) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Produk: ${barang.productName}"),
            Text("Harga: ${barang.price}"),
            Text("Jumlah: ${barang.productAmount}"),
            Text("Deskripsi: ${barang.description}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Lihat Item',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: modelList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBarangCard(modelList[index]);
        },
      ),
    );
  }
}
