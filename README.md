```
Fadhil Muhammad
2206083464
```

# poke_co

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<details>
<summary style="color: white; font-size: 30px">Tugas 8</summary>

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!


**Navigator.push():**

Metode `Navigator.push()` digunakan untuk menambahkan rute baru ke tumpukan rute. Dengan kata lain, rute yang baru ditambahkan akan muncul di atas rute yang sudah ada.

Contoh penggunaan:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke rute kedua menggunakan Navigator.push()
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('This is the Second Screen'),
      ),
    );
  }
}
```

Pada contoh di atas, ketika tombol "Go to Second Screen" ditekan, rute kedua ditambahkan ke tumpukan rute.

**Navigator.pushReplacement():**

Metode `Navigator.pushReplacement()` juga digunakan untuk menambahkan rute baru, tetapi dengan perbedaan bahwa rute saat ini digantikan (replaced) dengan rute baru. Artinya, rute yang ada dalam tumpukan akan dihapus dan digantikan oleh rute baru.

Contoh penggunaan:

```dart
ElevatedButton(
  onPressed: () {
    // Navigasi ke rute kedua menggunakan Navigator.pushReplacement()
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  },
  child: Text('Go to Second Screen (Replace)'),
),
```

Pada contoh ini, ketika tombol "Go to Second Screen (Replace)" ditekan, rute saat ini (First Screen) akan digantikan oleh rute baru (Second Screen) dalam tumpukan rute.

Ya, tentu! Berikut adalah contoh penambahan penggunaan `Navigator.push()` dan `Navigator.pushReplacement()` pada file menu.dart yang telah disediakan:

Pada contoh pada [menu.dart](lib/screens/menu.dart), ketika tombol "Tambah Item" ditekan, menggunakan `Navigator.push()` untuk membuka halaman `ItemFormPage`. Sedangkan, ketika tombol "Lihat Item" ditekan, menggunakan `Navigator.pushReplacement()` untuk mengganti rute saat ini dengan halaman `ItemListPage`. Perbedaan utama antara keduanya adalah penggunaan `Navigator.push()` menambahkan rute baru ke dalam tumpukan rute, sedangkan `Navigator.pushReplacement()` menggantikan rute saat ini dalam tumpukan dengan rute baru.

##  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Di Flutter, terdapat berbagai macam layout widget yang memungkinkan pengaturan tata letak (layout) yang berbeda dalam antarmuka pengguna. Berikut adalah beberapa layout widget utama beserta konteks penggunaannya:

1. **Container:**
   - **Konteks Penggunaan:** Container adalah widget serbaguna yang dapat mengatur tata letak, dekorasi, dan transformasi. Ini sering digunakan untuk mengelilingi widget lain dan memberikan padding, margin, atau batasan dimensi.

2. **Row dan Column:**
   - **Konteks Penggunaan:** Digunakan untuk menyusun widget secara horizontal (Row) atau vertikal (Column). Row dan Column dapat mengandung berbagai widget dan memberikan kemudahan dalam menyusun elemen-elemen antarmuka pengguna.

3. **ListView dan GridView:**
   - **Konteks Penggunaan:** ListView digunakan untuk menampilkan daftar elemen dengan cara bergulir, sementara GridView digunakan untuk menampilkan elemen-elemen dalam grid.

4. **Stack dan Positioned:**
   - **Konteks Penggunaan:** Stack digunakan untuk menumpuk widget di atas satu sama lain. Positioned digunakan di dalam Stack untuk mengatur posisi dari setiap widget dalam tumpukan.

5. **Expanded dan Flexible:**
   - **Konteks Penggunaan:** Digunakan untuk mengelola ruang di dalam widget seperti Row, Column, atau Flex. Expanded mengisi ruang yang tersedia secara proporsional, sementara Flexible memberikan kontrol lebih besar terkait cara ruang tersebut dibagi.

6. **SizedBox:**
   - **Konteks Penggunaan:** Digunakan untuk membuat kotak berukuran tetap yang dapat memberikan padding atau mengatur dimensi widget.

7. **Card dan ListTile:**
   - **Konteks Penggunaan:** Card dan ListTile digunakan untuk menampilkan informasi dalam bentuk kartu atau item daftar dengan cepat dan efisien.

8. **Wrap:**
   - **Konteks Penggunaan:** Wrap digunakan untuk menyusun widget dalam baris atau kolom, tetapi jika ruang tidak mencukupi, widget akan pindah ke baris atau kolom berikutnya.

9. **Align dan Center:**
   - **Konteks Penggunaan:** Align digunakan untuk mengatur widget di dalam parent widget sesuai dengan posisi yang diinginkan. Center digunakan untuk memusatkan widget di dalam parent widget.

10. **SingleChildScrollView:**
    - **Konteks Penggunaan:** Digunakan ketika kontennya lebih besar daripada ukuran layar sehingga dapat digulir. Memungkinkan penggunaan widget yang lebih besar daripada ukuran layar tanpa memerlukan paging.

11. **MediaQuery:**
    - **Konteks Penggunaan:** MediaQuery memungkinkan akses ke informasi tentang media seperti lebar dan tinggi layar. Berguna untuk membuat tata letak yang responsif terhadap perubahan ukuran layar.

Pemilihan layout widget tergantung pada kebutuhan desain dan struktur antarmuka pengguna. Kombinasi dari berbagai layout widget dapat digunakan untuk mencapai tata letak yang diinginkan.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Dalam file [item_form.dart](lib/screens/item_form.dart), terdapat beberapa elemen input pada formulir yang digunakan untuk mengumpulkan informasi karakter. Berikut adalah elemen-elemen input beserta penjelasan mengapa digunakan:

1. **TextFormField untuk Nama Karakter:**
   ```dart
   TextFormField(
     decoration: InputDecoration(
       hintText: "Nama Karakter",
       labelText: "Nama Karakter",
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0)
       ),
     ),
     onChanged: (String? value) {
       setState(() {
         _name = value!;
       });
     },
     validator: (String? value) {
       if (value == null || value.isEmpty) {
         return "Nama tidak boleh kosong!";
       }
       return null;
     },
   )
   ```
   - **Penjelasan:** TextFormField ini digunakan untuk mengambil input nama karakter. Input ini diberi dekorasi berupa label ("Nama Karakter"), placeholder ("Nama Karakter"), dan border yang diatur menggunakan `InputDecoration`. Validasi juga dilakukan untuk memastikan bahwa nama tidak boleh kosong.

2. **TextFormField untuk Jumlah:**
   ```dart
   TextFormField(
     decoration: InputDecoration(
       hintText: "Jumlah",
       labelText: "Jumlah",
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
     onChanged: (String? value) {
       setState(() {
         _amount = int.parse(value!);
       });
     },
     validator: (String? value) {
       if (value == null || value.isEmpty) {
         return "Jumlah tidak boleh kosong!";
       }
       if (int.tryParse(value) == null) {
         return "Jumlah harus berupa angka!";
       }
       return null;
     },
   )
   ```
   - **Penjelasan:** TextFormField ini digunakan untuk mengambil input jumlah karakter. Sama seperti sebelumnya, dekorasi dan validasi digunakan untuk memberikan panduan dan memastikan input yang diterima adalah angka.

3. **TextFormField untuk Deskripsi:**
   ```dart
   TextFormField(
     decoration: InputDecoration(
       hintText: "Deskripsi",
       labelText: "Deskripsi",
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
     onChanged: (String? value) {
       setState(() {
         _description = value!;
       });
     },
     validator: (String? value) {
       if (value == null || value.isEmpty) {
         return "Deskripsi tidak boleh kosong!";
       }
       return null;
     },
   )
   ```
   - **Penjelasan:** TextFormField ini digunakan untuk mengambil input deskripsi karakter. Dekorasi dan validasi digunakan untuk memberikan panduan dan memastikan deskripsi tidak boleh kosong.

4. **ElevatedButton untuk Menyimpan Data:**
   ```dart
   ElevatedButton(
     style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all(Colors.indigo),
     ),
     onPressed: () {
       // ...
     },
     child: const Text(
       "Save",
       style: TextStyle(color: Colors.white),
     ),
   )
   ```
   - **Penjelasan:** ElevatedButton ini digunakan untuk menyimpan data yang telah dimasukkan ke dalam formulir. Tombol ini hanya akan aktif jika formulir telah divalidasi dengan benar. Saat ditekan, data akan disimpan ke dalam model dan sebuah dialog akan muncul untuk memberi tahu pengguna bahwa koleksi berhasil tersimpan.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?

Clean Architecture pada aplikasi Flutter melibatkan pemisahan komponen menjadi lapisan Entities, Use Cases, Repositories, dan Frameworks/Drivers. Entities mendefinisikan objek bisnis, Use Cases menyimpan logika bisnis, Repositories menyediakan interface untuk mengakses data, dan Frameworks/Drivers adalah lapisan terluar yang berinteraksi dengan framework atau infrastruktur. Dependency injection digunakan untuk menyediakan implementasi konkret dari repository pada lapisan Use Cases dan framework/drivers. Ini memungkinkan pengorganisasian yang baik, pengujian yang lebih mudah, dan pemeliharaan kode yang lebih baik.

# Tahapan Implementasi

Untuk membuat halaman form pada tugas kali ini, berikut adalah langkah-langkahnya:

1. Membuat file [item_form.dart](lib/screens/item_form.dart) pada folder `lib\screens`.
2. Membuat laman route untuk form dan input fields untuk form. Detail mengenai kode ada pada [item_form.dart](lib/screens/item_form.dart).
3. Membuat tombol save yang diletakkan di bawah form inputs.
4. Menambahkan model [character.dart](lib/models/character.dart) untuk menyimpan data.
5. Mengkonfigurasi action `onPressed()` pada button save agar dapat menyimpan data ke dalam model yang ada pada [character.dart](lib/models/character.dart).
6. Menambahkan validasi input form sesuai pada [item_form.dart](lib/screens/item_form.dart).
7. Menambahkan routing laman layar pada [left_drawer.dart](lib/widgets/left_drawer.dart) dan [menu.dart](lib/screens/menu.dart) agar dapat melakukan routing page.
8. Untuk memunculkan data sesuai isi formulir yang disimpan, tambahkan alert dialog pada form.
    ```dart
    return AlertDialog(
        title: const Text('Koleksi berhasil tersimpan'),
        content: SingleChildScrollView(
        child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
            Text('Nama: $_name'),
            Text('Jumlah: $_amount'),
            Text('Deskripsi: $_description'),
            Text('Rarity: $_rarity'),
            Text('Power: $_power'),
            ],
        ),
        ),
        actions: [
        TextButton(
            child: const Text('OK'),
            onPressed: () {
            Navigator.pop(context);
            },
        ),
        ],
    );
    ```
9. Untuk menambahkan drawer, membuat file [left_drawer.dart](lib/widgets/left_drawer.dart) dan mengatur routing page agar routing sesuai dengan tombol yang ditekan.

10. Untuk memunculkan drawer, mengkonfigurasi `drawer` pada masing-masing laman dengan drawer pada [left_drawer.dart](lib/widgets/left_drawer.dart).

</details>

<details>
<summary style="color: white; font-size: 30px">Tugas 7</summary>

# Perbedaan utama antara **StatelessWidget** dan **StatefulWidget** dalam konteks pengembangan aplikasi Flutter:

## StatelessWidget

- **StatelessWidget** adalah widget yang mendeskripsikan bagian dari antarmuka pengguna yang dapat dikonfigurasi secara statis atau tidak berubah.
- Tidak dapat mengubah state setelah dibuat. Jika kita perlu mengubah tampilan widget, kita harus membuatnya lagi dengan data baru.
- StatelessWidget biasanya digunakan ketika bagian dari UI tidak bergantung pada apa pun selain konfigurasi awal dan konteks bawaan.
- Contoh: Icon, IconButton, dan Text adalah contoh widget yang tidak berubah.

## StatefulWidget

- **StatefulWidget**, di sisi lain, adalah widget yang dapat berubah sepanjang waktu (misal, dapat berubah selama runtime).
- Dapat mempertahankan state yang mungkin berubah selama durasi hidup widget.
- StatefulWidget biasanya digunakan untuk data yang dapat berubah selama waktu hidup widget. Misalnya, nilai dari slider, atau teks dalam teks field.
- Contoh: Checkbox, Radio, Slider, InkWell, Form, dan TextField adalah contoh widget yang dapat berubah.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

Berikut adalah daftar widget yang digunakan dalam tugas ini beserta penjelasan fungsinya:

1. `MaterialApp`: 
   - Fungsi: Widget yang digunakan untuk menginisialisasi aplikasi Flutter dengan konfigurasi dasar, seperti tema dan judul aplikasi.

2. `Scaffold`:
   - Fungsi: Widget yang menyediakan struktur kerangka aplikasi, termasuk AppBar dan body.

3. `AppBar`:
   - Fungsi: Widget yang digunakan untuk menampilkan bilah atas (app bar) yang biasanya berisi judul aplikasi.

4. `Text`:
   - Fungsi: Widget yang digunakan untuk menampilkan teks.

5. `GridView.count`:
   - Fungsi: Widget yang digunakan untuk membuat tata letak berbasis grid dengan jumlah baris dan kolom yang tetap.

6. `Container`:
   - Fungsi: Widget yang digunakan untuk mengelompokkan elemen-elemen lain dan mengatur properti seperti padding dan warna latar belakang.

7. `Icon`:
   - Fungsi: Widget yang digunakan untuk menampilkan ikon.

8. `InkWell`:
   - Fungsi: Widget yang membuat area responsif terhadap sentuhan (tappable) dan digunakan di sekitar konten yang ingin merespons sentuhan pengguna.

9. `Padding`:
   - Fungsi: Widget yang digunakan untuk menambahkan padding (ruang putih) ke elemen-elemen lainnya.

10. `Column`:
    - Fungsi: Widget yang digunakan untuk mengatur elemen-elemen secara vertikal dalam kolom.

11. `SnackBar`:
    - Fungsi: Widget yang digunakan untuk menampilkan pesan singkat (biasanya sebagai umpan balik) di bagian bawah layar.

# Implementasi Checklist
1. Untuk memulai atau membuat sebuah program Flutter baru, jalankan perintah berikut pada command prompt atau terminal:
    ```shell
    flutter create poke_co
    ```
    Dengan begitu, konfigurasi dasar untuk proyek Flutter akan tergenerate di folder `poke_co`.


2. Tahapan-tahapan untuk membuat tiga tombol dengan ikon dan teks untuk "Lihat Item", "Tambah Item", dan "Logout" adalah:

    - Mengatur isi file `main.dart` sesuai dengan isi pada file [main.dart](lib/main.dart) pada direktori `lib/main.dart`
    - Membuat dan mengatur isi file `menu.dart` sehingga sesuai dengan isi pada file [menu.dart](lib/menu.dart) pada direktori `lib/menu.dart`.

    Dalam file [menu.dart](lib/menu.dart) terdapat class HomeButtons yang menyimpan tombol-tombol yang akan ditampilkan sebagai berikut:
    ```dart
    class HomeButtons {
            final String name;
            final IconData icon;

            HomeButtons(this.name, this.icon);
        }
    ```
    dan juga ditambahkan kode berikut pada [menu.dart](lib/menu.dart):
    ```dart
        class ShopCard extends StatelessWidget {
        final HomeButtons item;

        // Map untuk menentukan warna background dari card
        static const Map<String, Color> itemColors = {
            "Lihat Item": Colors.blue,
            "Tambah Item": Colors.green,
            "Logout": Colors.red,
        };

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            Color backGroundColor = itemColors[item.name]!; // Set warna background sesuai map

            return Material(
            color: backGroundColor, // Set warna background sesuai map
            child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
    }
    ```

</details>