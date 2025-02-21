import 'package:flutter/material.dart';
import 'package:tugas2/cekBilangan.dart';
import 'package:tugas2/menu4.dart';
import 'package:tugas2/operasiBilangan.dart';
import 'package:tugas2/profile.dart';

class HomePage extends StatelessWidget {
  // List menu 
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Data Kelompok", "icon": Icons.person, "page": Profile()},
    {"title": "Operasi Bilangan", "icon": Icons.calculate, "page": Operasibilangan()},
    {"title": "Cek Ganjil Genap", "icon": Icons.percent, "page": Cekganjilgenap()},
    {"title": "Menjumlahkan Bilangan", "icon": Icons.add, "page": SumNumbersScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(menuItems[index]["icon"], color: Colors.blue), // Ikon berbeda
            title: Text(menuItems[index]["title"], style: TextStyle(fontSize: 20)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey), // Panah ke kanan
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => menuItems[index]["page"]),
              );
            },
          );
        },
      ),
    );
  }
}