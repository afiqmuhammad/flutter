import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profil_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/profil': (context) => const ProfilScreen(),
        '/daftar_teman': (context) => const DaftarTeman(),
      },
    );
  }
}

class DaftarTeman extends StatelessWidget {
  const DaftarTeman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Teman')),
      body: const Center(child: Text('Ini adalah halaman Daftar Teman.')),
    );
  }
}
