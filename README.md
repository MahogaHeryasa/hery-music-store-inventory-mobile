# hery_music_store_inventory

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
##
<details>
<summary><b><h1>Tugas 7</h1></b></summary>

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Statless widget
- widget hanya diupdate saat inisiasi pertama
- Tidak Memiliki fungsi internal `setState()`. widget hanya akan di-*render* sekali dan tidak akan memperbaharui widget itu sendiri lagi
- Merupakan widget statis
- Tidak dapat diperbaharui saat *runtime* kecuali terjadi *external event*

Stateful widget
- Widget dapat berubah secara dinamis
- Memiliki fungsi internal `setState()` yang dapat me-*render* widget ketika terjadi perubahan input data
- Merupakan widget dinamis
- Dapat diperbaharui saat *runtime* berdasarkan aksi user atau perubahan data

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

- `MyHomePage` = Widget utama yang mengatur struktur tampilan halaman utama 
- `AppBar` = Sebagai bar di bagian atas aplikasi
- `Scaffold` = Mengatur struktur utama dari aplikasi
- `SingleChildScrollView` = memungkinkan konten dapat digulir saat konten melebihi ruang layar yang tersedia
- `Padding` = Menambahkan ruang padding
- `Column` = Mengatur konten secara vertikal
- `Text` = Menampilkan teks nama aplikasi
- `GridView.count` = Membuat layout grid untuk konten dengan jumlah *column* yang ditentukan (terdapat 3 *column* pada aplikasi ini sesuai banyak tombol)
- `ButtonCard` = widget untuk setiap card tombol pada grid, menampilkan icon, text, warna, dan merespons interaksi pengguna dengan menampilkan SnackBar
- `Material` = memberikan design dan action dari card secara umum 
- `InkWell` = Memberikan area pada card yang responsiv terhadap sentuhan
- `Container` = Mengatur posisi widget `Icon` dan `Text` pada card

### 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

1. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
    - Membuat proyek flutter dengan perintah `flutter create hery_music_store_inventory`
    - Membuat file `menu.dart` pada direktori `lib`
    - Pada file `menu.dart` tambahkan

        ``` dart
        class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                        title: const Text(
                            'Inventory List',
                            style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: const Color.fromARGB(255, 146, 0, 0),
                    ),
                    body: SingleChildScrollView(

                        child: Padding(
                            padding: const EdgeInsets.all(10.0), 
                            child: Column(

                                children: <Widget>[
                                    const Padding(
                                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),

                                        child: Text(
                                            'Hery Music Store Inventory',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                );
            }
        }
        ```
        Kode ini digunakan sebagai struktur utama homepage dengan `AppBar` dan `SingleChildScrollView`
    - Import `menu.dart` ke `main.dart`

        ```dart
        import 'package:hery_music_store_inventory/menu.dart';
        ```
    - Ubah file  `main.dart` agar dapat menjalankan menjalankan widget `MyHomePage` pada saat inisiasi aplikasi

        ``` dart
        void main() {
            runApp(const MyApp());
        }

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
                        // the application has a blue toolbar. Then, without quitting the app,
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
                        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                        useMaterial3: true,
                    ),
                    home: MyHomePage(),
                );
            }
        }
        ```
        
2. Membuat tiga tombol sederhana dengan ikon dan teks 
    - Tambahkan *class* `ButtonItem` sebagai *class* untuk *button homepage* dengan atribut nama, icon, dan warna (bonus)

        ```dart
        class ButtonItem {
            final String name;
            final IconData icon;
            final Color color;

            ButtonItem(this.name, this.icon, this.color);
        }
        ``` 
    - Buat list `item` untuk menyimpan seluruh tombol 
        
        ```dart
        final List<ButtonItem> items = [];
        ```
        - Tambahkan widget `ButtonCard` pada `menu.dart` sebagai struktur card untuk *class* `ButtonItem`

        ```dart
        class ButtonCard extends StatelessWidget {
            final ButtonItem item;
            final Color cardColor;

            const ButtonCard(this.item, {required this.cardColor, Key? key})
                : super(key: key); // Constructor

            @override
            Widget build(BuildContext context) {
                return Material(
                    color: cardColor,
                    child: InkWell(
                        child: Container(
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
    - Tambahkan `GridView.count` pada *body* `SingleChildScrollView` dalam widget `MyHomePage` untuk menampilkan setiap tombol dalam grid dan menghubungkan tombol pada list `items` dengan widget `ButtonCard`

        ```dart
        class MyHomePage extends StatelessWidget {
        ...
            body: SingleChildScrollView(
            ...
                children: <Widget>[
                    ...
                    GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((ButtonItem item) {
                            return ButtonCard(item, cardColor: item.color);
                        }).toList(),
                    ),
                ]
            ...
            )
        ...
        }
        ```
    - Buat tombol untuk melihat daftar item (Lihat Item) dengan manambahkan objek `ButtonItem` pada list `items`

        ```dart
        final List<ButtonItem> items = [
            ButtonItem("Lihat Item", Icons.format_list_bulleted, const Color.fromARGB(255, 146, 0, 0)),
        ];
        ```
    - Buat tombol untuk menambah item (Tambah Item) dengan manambahkan objek `ButtonItem` pada list `items`

        ```dart
        final List<ButtonItem> items = [
            ...
            ButtonItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 90, 0, 0)),
        ];
        ```
    - Buat tombol untuk logout (Logout) dengan manambahkan objek `ButtonItem` pada list `items`

        ```dart
        final List<ButtonItem> items = [
            ...
            ButtonItem("Logout", Icons.logout, const Color.fromARGB(255, 26, 14, 0)),
        ];
        ```
3. Memunculkan Snackbar dengan tulisan "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan, "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan, "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

    - Tambahkan fungsi `onTap` pada `InkWell` di dalam `ButtonCard` yang akan memunculkan `SnackBar` dengan fungsi `showSnackBar` pada saat tombol ditekan
   
        ```dart    
        class ButtonCard extends StatelessWidget {
            ...
            child: InkWell(
                onTap: () {
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                ...
            )
        ...    
        }
        ```

        `content: Text("Kamu telah menekan tombol ${item.name}!")));` akan menampilkan message `SnackBar` sesuai dengan nama tombol yang ditekan 


</details>