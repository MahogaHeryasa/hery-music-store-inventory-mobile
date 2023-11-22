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
<details>
<summary><b><h1>Tugas 8</h1></b></summary>

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

 - `Navigator.push()`
    
    `Navigator.push()` berkerja dengan Menambahkan halaman baru ke dalam stack navigasi, halaman baru ditumpuk di atas halaman yang saat ini ditampilkan sehingga terdapat opsi *back* agar pengguna dapat kembali halaman sebelumnya. Salah satu contoh penggunaan metode ini terdapat pada potongan kode untuk tugas 8

    ``` dart
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ItemFormPage(),
    ));
    ```
    potongan kode ini digunakan untuk tombol tambah item pada *home page* sehingga pada saat pengguna menekan tombol ini berpindah ke halaman *item form* dan dapat kembali ke *home page* ketika menekan tombol *back* pada perangkat.

- `Navigator.pushReplacement()`

    `Navigator.pushReplacement()` berkerja dengan menggantikan halaman saat ini dengan halaman baru, halaman baru menjadi halaman teratas dalam stack, dan halaman yang lama dihapus dari stack. Salah satu contoh penggunaan metode ini terdapat pada potongan kode untuk tugas 8.

    ``` dart
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const ItemFormPage(),
    ));
    ```
    potongan kode ini digunakan untuk tombol tambah item pada *left drawer* sehingga pada saat pengguna menekan tombol ini berpindah ke halaman *item form* namun tidak dapat kembali ke halaman sebelum pindah halaman.

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

- Container: Digunakan untuk mengatur, menghias, serta mengumpulkan widget lain. Dapat digunakan untuk mengatur margin, padding, warna latar, dan lainnya.
- Row dan Column: Row digunakan untuk menempatkan widget secara horizontal, sedangkan Column digunakan untuk menempatkan widget secara vertikal.
- ListView: digunakan untuk menampilkan daftar scrollable widget, seperti daftar item atau menu. Memungkinkan tampilan konten yang lebih besar dari layar.
- Expanded: digunakan untuk mengisi ruang kosong yang tersedia dalam widget parent
- Stack: digunakan untuk menempatkan widget di atas satu sama lain. Widget dalam Stack dapat menumpuk dan mengoverlap.
- GridView: digunakan untuk menampilkan data dalam grid atau matriks. Berguna untuk menampilkan banyak item dalam susunan teratur.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Elemen input pada form yang digunakan pada tugas ini ini adalah `TextFormField()` yang menjadi *child* dari class `Form()`. `TextFormField()` digunakan karena input yang dibutuhkan pada tugas ini adalah teks dan bilangan bulat. teks diambil langsung dari nilai pada hasil input `TextFormField()`, sementara bilangan bulat diambil dari nilai pada hasil input `TextFormField()` yang di *parse* ke bilangan bulat untuk divalidasi diambil nilainya.   

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
 
Clean Architecture pada aplikasi Flutter diterapkan dengan menerapkan separation of concerns yang membagi tiga lapisan struktur proyek:

- Domain Layer (Core): Berisi logika bisnis, entitas, use case, dan objek nilai. Tidak bergantung pada detail implementasi seperti Flutter.
- Data Layer (Repositories): Berisi implementasi dari repository, sumber data eksternal, dan pemrosesan data.
- Presentation Layer (UI): Berisi kode terkait UI, seperti widget, halaman, dan presenter (jika digunakan).

Lapisan struktur proyek ini juga menerapkan prinsip dependency rule, yaitu domain layer sebagai pusat yang tidak bergantung pada lapisan lain dan masing masing lapisan direpresentasikan dengan paket atau modul yang terpisah.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Sebelum mengimplementasikan check list saya kelompokan file dart yang ada ke dalam beberapa direktori, file `menu.dart` dimasukkan ke dalam direktori `screens` yang akan menyimpan setiap halaman aplikasi, class `ButtonCard` dan class `ButtonCard` saya pindahkan ke dalam file `button_card.dart` di file tersebut dimasukkan ke dalam direktori `widgets` yang akan menyimpan setiap layout atau ektensi yang digunakan pada halaman aplikasi.

- Membuat halaman formulir tambah item baru
    - membuat file  `item_form.dart` di dalam direktori `screens`
    
        ```dart
        class ItemFormPage extends StatefulWidget {
            const ItemFormPage({super.key});

            @override
            State<ItemFormPage> createState() => _ItemFormPageState();
        }

        class _ItemFormPageState extends State<ItemFormPage> {
            final _formKey = GlobalKey<FormState>();

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                        title: const Center(
                        child: Text(
                            'Add New Item',
                        ),
                        ),
                        backgroundColor: const Color.fromARGB(255, 146, 0, 0),
                        foregroundColor: Colors.white,
                    ),
                    body: Form(
                        key: _formKey,
                        
                    ),
                );
            }
        }
        ```
        `_ItemFormPageState` akan digunakan sebagai widget yang menampilkan form. Atribut `_formkey` akan digunakan untuk mengatur *state*, validasi, penyimpanan form.
  

    ketentuan halaman sebagai berikut:

    - Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.

        - Tambahkan atribut `_name`, `_price`, `_description`, `_amount` pada class `_ItemFormPageState` untuk menyimpan setiap atribut `Item` yang akan diminta oleh form.

            ```dart
            class _ItemFormPageState extends State<ItemFormPage> {
                ...
                String _name = "";
                int _price = 0;
                String _description = "";
                int _amount = 0;
                ...
            }
            ```

        - Tambahkan beberapa `padding` yang meminta input dengan `TextFormField()` pada konten form

            ```dart
            class _ItemFormPageState extends State<ItemFormPage> {
                ...
                Widget build(BuildContext context) {
                    return Scaffold(
                        ...
                            body: Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                child:
                                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                                decoration: InputDecoration(
                                                    hintText: "Name",
                                                    labelText: "Name",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                ),
                                            ),
                                            onChanged: (String? value) {
                                                setState(() {
                                                    _name = value!;
                                                });
                                            },
                                            validator: (String? value) {
                                                if (value == null || value.isEmpty) {
                                                    return "Name cannot be empty!";
                                                }
                                                return null;
                                            },
                                        ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Description",
                                                labelText: "Description",
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
                                                    return "Description cannot be empty!";
                                                }
                                                return null;
                                            },
                                        ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                            hintText: "Amount",
                                            labelText: "Amount",
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
                                                    return "Amount cannot be empty!";
                                                }
                                                if (int.tryParse(value) == null) {
                                                    return "Amount must be numbers!";
                                                }
                                                return null;
                                            },
                                        ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Price",
                                                labelText: "Price",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                ),
                                            ),
                                            onChanged: (String? value) {
                                                setState(() {
                                                    _price = int.parse(value!);
                                                });
                                            },
                                            validator: (String? value) {
                                                if (value == null || value.isEmpty) {
                                                    return "Price cannot be empty!";
                                                }
                                                if (int.tryParse(value) == null) {
                                                    return "Prices must be numbers!";
                                                }
                                                return null;
                                            },
                                        ),
                                    ),
                                ]),
                            ),
                        ),
                    );
                }
            }
            ```

    - Memiliki sebuah tombol Save.

        - Tambahkan tombol pada list `Collumn` yanng berada di `SingleChildScrollView` body `Form`
        ```dart
        Align(
        alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 146, 0, 0)),
                        ),
                        onPressed: () {
                            if (_formKey.currentState!.validate()) {

                        }
                        _formKey.currentState!.reset();
                    },
                    child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                    ),
                ),
            ),
        ),
        ```
    - Setiap elemen input di formulir juga harus divalidasi dengan ketentuan setiap elemen input tidak boleh kosong dan setiap elemen input harus berisi data dengan tipe data atribut modelnya.

        - Pada setiap Text form sudah ditambahkan validator untuk memastikan validasi setiap elemen input tidak boleh kosong dan setiap elemen input harus berisi data dengan tipe data atribut modelnya.

            Pada atribut yang menerima *string* ditambahkan

            ```dart
            validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "//nama atribut// cannot be empty!";
                }
                return null;
            },
            ```
            Pada atribut yang menerima *integer* ditambahkan 

            ```dart
            validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "//nama atribut// cannot be empty!";
                }
                if (int.tryParse(value) == null) {
                    return "//nama atribut// must be numbers!";
                }
                return null;
            },
            ```
- Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

    - Pada class `ButtonCard` tambahkan `Navigator.push()` yang memindahkan pengguna ke halaman `ItemFormPage()` untuk tombol "Tambah Item" di dalam method `onTap()`

        ```dart
        class ButtonCard extends StatelessWidget {
            ...
            Widget build(BuildContext context) {
                ...
                    onTap: () {
                    ...
                    if (item.name == "Tambah Item") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemFormPage(),
                            ));
                    }
                ...
                }  
            ... 
            }
        ...
        }
        ```
- Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

    - Tambahkan `showDialog()` yang akan menampilkan `AlertDialog()` degan konteks atribut item pada `ElevatedButton()` yang ditekan dan di validasi

        ```dart
        ...
        child: ElevatedButton(
                ...
                onPressed: () {
                    if (_formKey.currentState!.validate()) {

                    showDialog(
                        context: context,
                        builder: (context) {
                            return AlertDialog(
                                title: const Text('Item Added Successfully'),
                                content: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text('Name: $_name'),
                                            Text('Description: $_description'),
                                            Text('Amount: $_amount'),
                                            Text('Price: $_price'),
                                        ],
                                    ),
                                ),
                            )
                        }
                    )
                }
                ...
            }
            ...
        ),
        ``` 
- Membuat sebuah drawer pada aplikasi

    - Tambahkan file `left_drawer` pada direktori `widgets` dan implementasikan class `Drawer`

        ```dart
        class LeftDrawer extends StatelessWidget {
            const LeftDrawer({super.key});

            @override
            Widget build(BuildContext context) {
                return Drawer(
                    child: ListView(
                        children: [
                            const DrawerHeader(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 146, 0, 0),
                                ),
                                child: Column(
                                    children: [
                                        Text(
                                            'Hery Music Store Inventory',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                            ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        Text(
                                            "Manage your music store inventory here!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                );
            }
        }

        ```
    - import `LeftDrawer` untuk `menu.dart` dan `item_form.dart`

        ```dart
        import 'package:hery_music_store_inventory/widgets/left_drawer.dart';
        ```
    - Impelementasikan pada halaman dengan menambahkan `drawer: LeftDrawer()` pada widget halaman
    
    ketentuan drawer sebagai berikut:
    - Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.

        - tambahkan `ListTile` pada `ListView` milik `Drawer` yang memuat icon dan teks untuk Halaman Utama dan Tambah Item

            ```dart
            class LeftDrawer extends StatelessWidget {
                ...
                    return Drawer(
                        child: ListView(
                            ...
                                ListTile(
                                    leading: const Icon(Icons.home_outlined),
                                    title: const Text('Home Page'),
                                ),
                                ListTile(
                                    leading: const Icon(Icons.add_shopping_cart),
                                    title: const Text('Tambah Item'),
                                ),
                            ...
                        ),
                    );
                ...
            }
            
            ```
    - Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.

        - Tambahkan `Navigator.pushReplacement` pada `onTap` milik `ListTile` yang menggantikan stack halaman teratas (halaman pengguna saat ini) dengan halaman `MyHomePage()`

            ```dart
            ...
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home Page'),
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                    ));
                },
            ),
            ...
            ```
    - Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

        - Tambahkan `Navigator.pushReplacement` pada `onTap` milik `ListTile` yang menggantikan stack halaman teratas (halaman pengguna saat ini) dengan halaman `ItemFormPage()`

            ```dart
            ...
            ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: const Text('Tambah Item'),
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemFormPage(),
                    ));
                },
            ),
            ...
            ```
</details>

<details>
<summary><b><h1>Tugas 9</h1></b></summary>

### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Dalam Flutter, kita dapat menggunakan tipe data `Map<String, dynamic>` untuk menangani data JSON secara dinamis. Namun hal tersebut tidak lebih baik daripada membuat model karena pembuatan model memberikan struktur yang jelas pada data yang diambil dari JSON, menyediakan tipe data yang jelas dan aman selama kompilasi, serta memudahkan kode untuk dibaca dan dikelola.

### 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa *instance* CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest adalah bagian dari http package di Flutter yang digunakan untuk membuat dan mengelola permintaan HTTP dengan dukungan cookie. Instance CookieRequest perlu dibagikan ke semua komponen agar semua komponen di aplikasi Flutter dapat berbagi informasi cookie yang sama sehingga terjaga keberlanjutan sesi dan otentikasi ketika berkomunikasi dengan server.

### 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Pertama, dengan membuat kelas model yang mewakili atribut data yang akan diambil, model akan menghubunggkan data dari server dan tampilan pada flutter. Kemudian, dengan menggunakan *service class* yang mengambil data dari server seperti `http`, data dari server akan diambil dan dikirimkan ke dalam aplikasi flutter. Terakhir, buat widget yang menampilkan data dari model.

### 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Pertama, buat halaman login pada flutter. Buat suatu fungsi login didalam berkas halaman login flutter yang mengirimkan request login ke server aplikasi Django. Buat fungsi login pada `views.py` Django yang akan mengatur request login. Terakhir, ketika user ter-autentikasi pada fungsi login flutter, lakukan `Navigator.push()` untuk merubah halaman dan menampilkan menu pada aplikasi flutter.

### 5. Sebutkan seluruh *widget* yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

- `FutureBuilder`: Mengelola state Future untuk menangani data asynchronous.
- `ListView`: Menampilkan daftar item dengan scrolling.
- `TextField`: Menyediakan input teks untuk pengguna.
- `TextFormField`: Membuat *text field* dengan parameter *controller* `TextEditingController`.
- `ElevatedButton`: Membuat tombol dengan tampilan yang lebih tinggi.
- `GestureDetector`: menanggapi berbagai jenis interaksi pengguna, seperti *tap*, *long press*, dan *swipe*.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara *step-by-step*!

- Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

    - Tambahkan `django-cors-headers` ke dalam `requirements.txt`, `corsheaders` ke dalam list INSTALLED_APPS `settings.py`, dan `corsheaders.middleware.CorsMiddleware` ke dalam list MIDDLEWARE di `settings.py`.
    - Tambahkan juga potongan kode berikut pada `settings.py` untuk memastikan pertukaran data dengan flutter

        ```python
        CORS_ALLOW_ALL_ORIGINS = True
        CORS_ALLOW_CREDENTIALS = True
        CSRF_COOKIE_SECURE = True
        SESSION_COOKIE_SECURE = True
        CSRF_COOKIE_SAMESITE = 'None'
        SESSION_COOKIE_SAMESITE = 'None'
        ```
    - Push kembali proyek Django setelah semua langkah-langkah selesai untuk men-*deploy* ulang.

- Membuat halaman login pada proyek tugas Flutter.

    - Tambahkan *package* `provider` dan `pbp_django_auth` untuk mendukung keberlangsungan autentikasi Flutter dengan Django.
    - Tambahkan file `login.dart` pada direktori `screens` dan tambahkan potongan kode berikut

        ```dart
        // ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, duplicate_ignore

        import 'package:hery_music_store_inventory/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

            @override
            Widget build(BuildContext context) {
                return MaterialApp(
                    title: 'Login',
                    theme: ThemeData(
                        primarySwatch: Colors.blue,
                    ),
                    home: const LoginPage(),
                    );
            }
        }

        class LoginPage extends StatefulWidget {
            const LoginPage({super.key});

            @override
            _LoginPageState createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();

            @override
            Widget build(BuildContext context) {
                final request = context.watch<CookieRequest>();
                return Scaffold(
                    appBar: AppBar(
                        title: const Text('Login'),
                    ),
                    body: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                TextField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Username',
                                    ),
                                ),
                                const SizedBox(height: 12.0),
                                TextField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        labelText: 'Password',
                                    ),
                                obscureText: true,
                                ),
                                const SizedBox(height: 24.0),
                                ElevatedButton(
                                    onPressed: () async {
                                        String username = _usernameController.text;
                                        String password = _passwordController.text;

                                        final response =
                                            await request.login("http://127.0.0.1:8000//auth/login/", {
                                        'username': username,
                                        'password': password,
                                        });

                                        if (request.loggedIn) {
                                            String message = response['message'];
                                            String uname = response['username'];
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => MyHomePage()),
                                            );
                                            ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                    content: Text("$message Selamat datang, $uname.")));
                                        } else {
                                        // ignore: use_build_context_synchronously
                                            showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                    title: const Text('Login Gagal'),
                                                    content: Text(response['message']),
                                                    actions: [
                                                        TextButton(
                                                            child: const Text('OK'),
                                                            onPressed: () {
                                                                Navigator.pop(context);
                                                            },
                                                        ),
                                                    ],
                                                ),
                                            );
                                        }
                                    },
                                    child: const Text('Login'),
                                ),
                            ],
                        ),
                    ),
                );
            }
        }

        ```

        Pada halaman login akan diminta username dan password melalui *text field* dan diautentikasi dengan memanggil fungsi login yang akan dibuat pada proyek Django.

- Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

    - Pada proyek Django, tambahkan app baru bernama `authentication`. Tambahkan pada INSTALLED_APP `settings.py`, dan tambhkan path url pada `urls.py` proyek.
    - Tambahkan fungsi `login` dan `logout` pada `views.py` agar Flutter dapat menjalankan autentikasi dengan *fetch* kedua fungsi tersebut

        ```python
        from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
        from django.http import JsonResponse
        from django.views.decorators.csrf import csrf_exempt

        @csrf_exempt
        def login(request):
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    auth_login(request, user)
                    return JsonResponse({
                        "username": user.username,
                        "status": True,
                        "message": "Login sukses!"
                    }, status=200)
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login gagal, akun dinonaktifkan."
                    }, status=401)

            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, periksa kembali username atau kata sandi."
                }, status=401)
            
        @csrf_exempt
        def logout(request):
            username = request.user.username

            try:
                auth_logout(request)
                return JsonResponse({
                    "username": username,
                    "status": True,
                    "message": "Logout berhasil!"
                }, status=200)
            except:
                return JsonResponse({
                "status": False,
                "message": "Logout gagal."
                }, status=401)
        ```
        Kedua fungsi tersebut memiliki algoritma yang sama dengan pemanggilan kedua fungsi pada `main` proyek Django, hanya saja kedua fungsi tersebut mengembalikan `JsonResponse` sebagai message yang akan ditampilkan pada Flutter.

    - Buat file `urls.py` dan tambahkan path untuk fungsi `login` dan `logout`.
    - Pada Flutter, ubah `main.dart` sehingga menerapkan `provider` dan `CookieRequest` agar dapat diterapkan semua widget, serta ubah routing halaman pertam yang ditampilkan adalah halaman login

        ```dart
        ...
        class MyApp extends StatelessWidget {
        ...
        Widget build(BuildContext context) {
            return Provider(
                create: (_) {
                    CookieRequest request = CookieRequest();
                    return request;
                },
                child: MaterialApp(
                    title: 'Flutter Demo',
                    theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(
                            seedColor: const Color.fromARGB(255, 146, 0, 0)),
                        useMaterial3: true,
                    ),
                    home: const LoginPage(),
                ));
            }
        }
        ```  
    - Tambahkan *request cookies* pada class `ButtonCard` agar dapat membaca `CookieRequest` untuk implementasi `logout` pada tombol logout

        ```dart
        class ButtonCard extends StatelessWidget {
        ...

            @override
            Widget build(BuildContext context) {
                final request = context.watch<CookieRequest>();
            }
            ...
        }
        ```
    - Implemntasikan fungsi `logout` dengan menambahkan potongan kode berikut pada tombol logout

        ```dart
        ...
         else if (item.name == "Logout") {
            final response = await request.logout(
                "http://127.0.0.1:8000//auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        ...
        ``` 

- Membuat model kustom sesuai dengan proyek aplikasi Django.
    - Tambahkan file `item.dart` pada berkas `models`

        ```dart
        // To parse this JSON data, do
        //
        //     final item = itemFromJson(jsonString);

        import 'dart:convert';

        List<Item> itemFromJson(String str) =>
            List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

        String itemToJson(List<Item> data) =>
            json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

        class Item {
        String model;
        int pk;
        Fields fields;

        Item({
            required this.model,
            required this.pk,
            required this.fields,
        });

        factory Item.fromJson(Map<String, dynamic> json) => Item(
                model: json["model"],
                pk: json["pk"],
                fields: Fields.fromJson(json["fields"]),
            );

        Map<String, dynamic> toJson() => {
                "model": model,
                "pk": pk,
                "fields": fields.toJson(),
            };
        }

        class Fields {
        int user;
        String name;
        DateTime dateAdded;
        int price;
        String description;
        int amount;

        Fields({
            required this.user,
            required this.name,
            required this.dateAdded,
            required this.price,
            required this.description,
            required this.amount,
        });

        factory Fields.fromJson(Map<String, dynamic> json) => Fields(
                user: json["user"],
                name: json["name"],
                dateAdded: DateTime.parse(json["date_added"]),
                price: json["price"],
                description: json["description"],
                amount: json["amount"],
            );

        Map<String, dynamic> toJson() => {
                "user": user,
                "name": name,
                "date_added":
                    "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
                "price": price,
                "description": description,
                "amount": amount,
            };
        }
        ```
        Model ini digunakan untuk menerima data dari server Django dengan format JSON.

- Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
    - Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.


        - Tambahkan file `list_item.dart` pada direktori `screens`

            ```dart
            import 'package:flutter/material.dart';
            import 'package:hery_music_store_inventory/screens/item_details.dart';
            import 'package:http/http.dart' as http;
            import 'dart:convert';
            import 'package:hery_music_store_inventory/models/item.dart';
            import 'package:hery_music_store_inventory/widgets/left_drawer.dart';

            class ItemPage extends StatefulWidget {
            const ItemPage({Key? key}) : super(key: key);

            @override
            // ignore: library_private_types_in_public_api
            _ItemPageState createState() => _ItemPageState();
            }

            class _ItemPageState extends State<ItemPage> {
                Future<List<Item>> fetchItem() async {
                    var url = Uri.parse('http://127.0.0.1:8000/json/');
                    var response = await http.get(
                        url,
                        headers: {"Content-Type": "application/json"},
                    );

                    var data = jsonDecode(utf8.decode(response.bodyBytes));

                    List<Item> listItem = [];
                    for (var d in data) {
                        if (d != null) {
                            listItem.add(Item.fromJson(d));
                        }
                    }
                    return listItem;
            }

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                    title: const Text(
                        'Item List',
                        style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color.fromARGB(255, 146, 0, 0),
                    ),
                    drawer: const LeftDrawer(),
                    body: FutureBuilder(
                        future: fetchItem(),
                        builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                            return const Center(child: CircularProgressIndicator());
                        } else {
                            if (!snapshot.hasData) {
                            return const Column(
                                children: [
                                Text(
                                    "Tidak ada data produk.",
                                    style:
                                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                ),
                                SizedBox(height: 8),
                                ],
                            );
                            } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.all(20.0),
                                    child: InkWell(
                                        onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ItemDetails(snapshot.data![index])));
                                        },
                                        child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                            "${snapshot.data![index].fields.name}",
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                "Description: ${snapshot.data![index].fields.description}"),
                                            const SizedBox(height: 10),
                                            Text(
                                                "Amount: ${snapshot.data![index].fields.amount}")
                                        ],
                                        ),
                                    )));
                            }
                        }
                        }));
            }
            }

            ```
            `ItemPage` akan melakukan fetch melalui url Django yang mengambil semua data atribut `Item` dengan format JSON, mengubah nya menjadi objek `Item`, mengumpulkannya dalam list, lalu menampilkan seluruh `Item` pada `ListView`.  
            
- Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
    - Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
        - Dengan potongan kode berikut pada setiap `Item` dalam `ListView`, setiap item akan dipindahkan ke halaman `ItemDetails` yang menerima argumen objek `Item` pada index nya.

            ```dart
            ...
            onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ItemDetails(snapshot.data![index])));
            },
            ...
            ```
        
    - Tampilkan seluruh atribut pada model item kamu pada halaman ini.
        - Tambahkan file `item_details.dart` pada `screens` 

            ```dart
            import 'package:flutter/material.dart';
            import 'package:hery_music_store_inventory/models/item.dart';
            import 'package:hery_music_store_inventory/screens/list_item.dart';
            import 'package:hery_music_store_inventory/widgets/left_drawer.dart';

            class ItemDetails extends StatelessWidget {
                final Item item;
                const ItemDetails(this.item, {super.key});

                @override
                Widget build(BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(
                            title: const Text(
                            'Item Details',
                            style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: const Color.fromARGB(255, 146, 0, 0),
                        ),
                        drawer: const LeftDrawer(),
                        body: SingleChildScrollView(
                            child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                        children: [
                                            Text(
                                                item.fields.name,
                                                style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text("Description: ${item.fields.description}"),
                                            const SizedBox(height: 10),
                                            Text("Amount: ${item.fields.amount.toString()}"),
                                            const SizedBox(height: 10),
                                            Text("Price: ${item.fields.price.toString()}"),
                                            const SizedBox(height: 10),
                                            Text("Date Added: ${item.fields.dateAdded.toString()}"),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                    );
                }
            }

            ```
            `ItemDetails` akan menampilkan seluruh atribut dari `Item` yang di-*passing* pada argumen

    - Tambahkan tombol untuk kembali ke halaman daftar item.

        -Tambahkan `ElevatedButon` dibawah kumpulan text atribut yang akan kembali ke halaman daftar item ketika ditekan

            ```dart
            ...
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 146, 0, 0)),
                        ),
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ItemPage()));
                        },
                        child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                        ),
                    ),
                ),
            ),
            ...
            ```
</details>