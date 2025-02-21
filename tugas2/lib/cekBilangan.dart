import 'package:flutter/material.dart';

class Cekganjilgenap extends StatefulWidget {
  @override
   _CekganjilgenapState createState() => _CekganjilgenapState();
}

class _CekganjilgenapState extends State<Cekganjilgenap> {
  TextEditingController numController = TextEditingController();
  String result = "";
  

  void cekganjilgenap() {
    int num = int.tryParse(numController.text) ?? 0;
    setState(() {
      result = (num % 2 == 0) ? "Genap" : "Ganjil" ;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cek Ganjil Genap')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Angka'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cekganjilgenap,
              child: Text('Cek'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}