import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  bool _isDarkTheme = false; // Untuk toggle tema

  @override
  Widget build(BuildContext context) {
    // Definisi warna berdasarkan tema
    final backgroundColor = _isDarkTheme ? Colors.black : Colors.grey[100];
    final textColor = _isDarkTheme ? Colors.white : Colors.black;
    final subTextColor = _isDarkTheme ? Colors.grey[400] : Colors.grey[700];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // AppBar biru terang
        title: const Text("Profil Saya"),
        actions: [
          IconButton(
            icon: Icon(
              _isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round,
              color: Colors.orange,
            ),
            onPressed: () {
              setState(() {
                _isDarkTheme = !_isDarkTheme;
              });
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar Profil
            ClipOval(
              child: Image.asset(
                'images/afiq.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 120,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Nama
            Text(
              'Afiq Muhammad Nur Marzuki',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),

            // Tentang Diri
            Text(
              'Developer Flutter | Penggemar Teknologi | Senang Berbagi Ilmu',
              style: TextStyle(fontSize: 16, color: subTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Email
            Text(
              'Email: afiq@gmail.com',
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
