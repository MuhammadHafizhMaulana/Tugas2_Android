import 'package:flutter/material.dart';

class SumNumbersScreen extends StatefulWidget {
  @override
  _SumNumbersScreenState createState() => _SumNumbersScreenState();
}

class _SumNumbersScreenState extends State<SumNumbersScreen> {
  TextEditingController numbersController = TextEditingController();
  String result = "0";
  String lengthResult = "0";

  void calculateSum() {
    List<String> numbers = numbersController.text.split(" ");
    double sum = 0;
    
    for (var number in numbers) {
      sum += double.tryParse(number) ?? 0;
    }
    
    setState(() {
      result = sum % 1 == 0 ? sum.toInt().toString() : sum.toStringAsFixed(2);
      lengthResult = numbersController.text.replaceAll(" ", "").length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Penjumlahan Beberapa Bilangan')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numbersController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Masukkan angka dipisahkan oleh spasi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSum,
              child: Text('Hitung Total'),
            ),
            SizedBox(height: 20),
            Text(
              'Total: $result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),SizedBox(height: 10),
            Text(
              'Panjang Karakter: $lengthResult',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}