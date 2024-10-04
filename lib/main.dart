import 'package:flutter/material.dart';
import 'package:kuis_mobile_124220010/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Mobile',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false, //untuk menghilangkan banner debug
      home: LoginPage(), //menampilkan halaman Login
    );
  }
}
