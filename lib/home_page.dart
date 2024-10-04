import 'package:flutter/material.dart';
import 'package:kuis_mobile_124220010/bantuan.dart';
import 'package:kuis_mobile_124220010/data_barang_dummy.dart';

class MainPage extends StatelessWidget {
  final String username;
  MainPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Datang $username <3", //menampilkan sambutan disertai username yang diinputkan
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //mengatur jumlah item per baris
                  crossAxisSpacing: 10.0, //Jarak antar item secara horizontal
                  mainAxisSpacing: 10.0, // Jarak antar item secara vertikal
                  childAspectRatio: 3 / 4, //Rasio ukuran grid
                ),
                itemCount:
                    supermarketItemList.length, //mendefinisikan dari data dummy
                itemBuilder: (context, index) {
                  var item = supermarketItemList[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            item.imageUrls[0],
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item.price,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 88, 85, 85)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20), //tambah sedikit jarak
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //navigasi ke halaman berikutnya (bantuan)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bantuan()), //menuju halaman bantuan
                  );
                },
                child: Text(
                  'Butuh Bantuan?',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
