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
        dan juga ditambahkan kode berikut pada `menu.dart`:
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