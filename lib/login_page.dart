import 'package:flutter/material.dart';
import 'package:kuis_mobile_124220010/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;

  _navigatePage() async {
    await Future.delayed(
        Duration(seconds: 2)); //memberikan delayed untuk ke halaman utama
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainPage(
        username: username,
      );
    }));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page", style: TextStyle(color: Colors.white)),
          centerTitle: true, //meletakkan title bar di center
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            _upnLogo(),
            _usernameField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _upnLogo() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Image.asset(
        //menampilkan logo upn
        'assets/upnLogo.png',
        height: 150,
        width: 150,
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 10, 129, 40))),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            password = value;
          },
          obscureText: true, //untuk menyamarkan inputan
          decoration: InputDecoration(
            hintText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 10, 129, 40))),
          ),
        ));
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context)
          .size
          .width, //harus didefinisikan dulu di dalam widgetnya BuildContext
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
          ),
          onPressed: () {
            String text = "";
            if (username == "Admin" && password == "1234") {
              _navigatePage(); // setting hanya untuk kondisi sukses agar bisa melanjutkan halaman berikutnya
              setState(() {
                text = "Login Sukses";
                isLoginSuccess = true;
              });
              text = "Login Sukses";
            } else {
              setState(() {
                text = "Login Gagal";
                isLoginSuccess = false;
              });
              text = "Login Gagal";
            }
            SnackBar snackBar = SnackBar(
              content: Text(text),
              duration: Duration(seconds: 2), //memberikan durasi waktu snackbar
              backgroundColor: isLoginSuccess
                  ? Colors.green
                  : Colors.red, //hijau untuk sukses, merah untuk gagal
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Login Sekarang!')),
    );
  }
}
