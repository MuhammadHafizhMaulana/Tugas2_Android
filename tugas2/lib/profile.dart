import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> members = [
      {"name": "Muhammad Hafizh Maulana", "nim": "123210194", "kelas" : "IF-B", "image": "assets/hafizh.jpg"},
      {"name": "Gustansyah Dwi Putra Sujanto", "nim": "123220210", "kelas" : "IF-B", "image": "assets/gustansyah.jpeg"},
      {"name": "Dimas Proboningrat", "nim": "123220211", "kelas" : "IF-B", "image": "assets/dimas.jpeg"},
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Data Kelompok")),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  members[index]["image"]!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                members[index]["name"]!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NIM: ${members[index]["nim"]!}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Kelas: ${members[index]["kelas"]!}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
