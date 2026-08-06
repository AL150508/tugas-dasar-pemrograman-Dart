import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

  /* ===== KODE TUGAS SEBELUMNYA (RPL-12.2-201 s.d. 204) - DIKOMEN DULU =====
  // data barang
  String namaBarang = "bakso tanpa tepung";
  double hargaAnggota = 3000;
  double hargaUmum = 3500;
  int jumlahBeli = 40;
  int jumlahStok = 20;
  String kategori = "makanan";

  // status pembeli
  bool anggota = true;

  // status ketersediaan berdasarkan stok
  bool tersedia;
  if (jumlahStok > 0) {
    tersedia = true;
  } else {
    tersedia = false;
  }

  // 1. tentukan harga sesuai jenis pembeli
  double hargaSatuan;
  if (anggota) {
    hargaSatuan = hargaAnggota;
  } else {
    hargaSatuan = hargaUmum;
  }

  // hitung total belanja sebelum diskon
  double total = hargaSatuan * jumlahBeli;

  // 2. tentukan potongan borongan (if bertingkat)
  double persenPotongan;
  if (total > 200000) {
    persenPotongan = 0.10;
  } else if (total > 100000) {
    persenPotongan = 0.05;
  } else {
    persenPotongan = 0.0;
  }

  // hitung potongan dan harga akhir
  double potongan = total * persenPotongan;
  double hargaAkhir = total - potongan;

  // tentukan rak penyimpanan berdasarkan kategori
  String rak;
  switch (kategori) {
    case "atk":
      rak = "Rak 1";
      break;
    case "makanan":
      rak = "Rak 2";
      break;
    case "minuman":
      rak = "Rak 3";
      break;
    default:
      rak = "Rak lain";
  }

  print("=== STRUK BELANJA ===");
  print("Nama barang   : $namaBarang");
  print("Status        : ${anggota ? 'Anggota' : 'Umum'}");
  print("Harga satuan  : Rp$hargaSatuan");
  print("Jumlah beli   : $jumlahBeli pcs");
  print("Total belanja : Rp$total");
  print(
    "Potongan      : ${(persenPotongan * 100).toStringAsFixed(0)}% (Rp$potongan)",
  );
  print("Harga akhir   : Rp$hargaAkhir");
  print("Stok          : $jumlahStok");
  if (tersedia) {
    print("Status stok   : Tersedia");
  } else {
    print("Status stok   : Stok habis, tidak tersedia");
  }
  print("Kategori      : $kategori");
  print("Rak           : $rak");

  print("");
  print("=== UJI SKENARIO ===");
  ujiSkenario(true, 250000);
  ujiSkenario(false, 150000);
  ujiSkenario(false, 50000);
  ===== AKHIR KODE LAMA ===== */
  /*
  // daftar barang bernomor
  List<String> namaBarangList = ["Buku Tulis", "Pulpen", "Penghapus", "Roti"];
  List<int> hargaBarangList = [3000, 2500, 1500, 5000];

  print("=== DAFTAR BARANG ===");
  for (int i = 0; i < namaBarangList.length; i++) {
    print("${i + 1}. ${namaBarangList[i]} - Rp. ${hargaBarangList[i]}");
  }
*/
  //perulangan while
  print("");
  int stok = 3;
  print("--- Penjualan Buku Tulis ---");
  while (stok > 0) {
    stok = stok - 1;
    print("Terjual 1, sisa stok: $stok");
  }
}
// Bahaya jika kondisi berhenti pada while keliru (misalnya salah menulis stok >= 0
// alih-alih stok > 0), program bisa terus mengurangi stok sampai minus, sehingga
// tampil "sisa stok: -1" yang artinya koperasi menjual barang yang sudah tidak ada.
// Untuk memastikan koperasi tidak menjual melebihi stok, kondisi while harus tepat
// menggunakan stok > 0, sehingga perulangan otomatis berhenti begitu stok mencapai 0
// dan tidak akan pernah bernilai negatif.

//
/*
void ujiSkenario(bool anggota, double total) {
  double persenPotongan;
  if (total > 200000) {
    persenPotongan = 0.10;
  } else if (total > 100000) {
    persenPotongan = 0.05;
  } else {
    persenPotongan = 0.0;
  }

  double potongan = total * persenPotongan;
  double hargaAkhir = total - potongan;

  print(
    "${anggota ? 'Anggota' : 'Umum'}, total $total "
    "-> Potongan: ${(persenPotongan * 100).toStringAsFixed(0)}% "
    "-> Harga akhir: Rp$hargaAkhir",
  );
}
*/
// pemilihan tipe data harus bner agar perhitungan menjadi akurat
// pakai int karena jumlah barang tidak mungkin pecahan. Jika tipe data salah dipilih,

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
