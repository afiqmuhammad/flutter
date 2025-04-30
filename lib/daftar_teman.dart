import 'package:flutter/material.dart';

class DaftarTemanScreen extends StatefulWidget {
  const DaftarTemanScreen({super.key});

  @override
  State<DaftarTemanScreen> createState() => _DaftarTemanScreenState();
}

class _DaftarTemanScreenState extends State<DaftarTemanScreen> {
  final List<String> semuaTeman = const [
    'waras tri wijaya',
    'abdul fuad',
    'adi tegar',
    'aji kiaa',
    'amanda',
    'alfi fadhli',
    'sultan syah',
    'dyah purwaningsih',
    'rafael theo',
    'muhammad noviyanto',
    'maheswara',
    'nur rahman',
    'claudea cahaya',
    'nabilah junita',
    'atik setyaningsih',
    'faisal',
    'zulfa',
    'arco putra',
  ];

  List<String> hasilPencarian = [];

  @override
  void initState() {
    super.initState();
    hasilPencarian = semuaTeman;
  }

  void _cariTeman(String query) {
    final hasil =
        semuaTeman.where((teman) {
          return teman.toLowerCase().contains(query.toLowerCase());
        }).toList();

    setState(() {
      hasilPencarian = hasil;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Teman")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari teman...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onChanged: _cariTeman,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hasilPencarian.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(hasilPencarian[index]),
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                DetailTemanScreen(nama: hasilPencarian[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailTemanScreen extends StatelessWidget {
  final String nama;

  const DetailTemanScreen({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Teman")),
      body: Center(
        child: Text(
          'Ini adalah detail dari $nama.',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
