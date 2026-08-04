import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

  // kenapa pakai switch biar ringan
  // soalnya di sini cuma ngecek satu variabel (kategori) yang dibandingin
  // sama beberapa nilai pasti makanan. kalau pakai if-else
  // berjenjang jadi banyak baris "if kategori == ..." yang mirip-mirip dan
  // kebaca berulang
  // tampilkan hasil
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

  // ===== uji skenario tabel c =====
  print("");
  print("=== UJI SKENARIO ===");
  ujiSkenario(true, 250000); // a. anggota, total 250.000
  ujiSkenario(false, 150000); // b. umum, total 150.000
  ujiSkenario(false, 50000); // c. umum, total 50.000
}

// fungsi buat uji logika potongan borongan terhadap total tertentu
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
// pemilihan tipe data harus bner agar perhitungan menjadi akurat
// pakai int karena jumlah barang tidak mungkin pecahan. Jika tipe data salah dipilih,

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
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
