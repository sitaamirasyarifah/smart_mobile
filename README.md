# smart_mobile

Nama    : Sita Amira Syarifah
NPM     : 2206023023
Kelas   : PBP B


<details>
<summary> <b> TUGAS 9 </b> </summary>

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Iya, kita mampu mengakses data JSON tanpa perlu membuat model terlebih dahulu. Mengambil data JSON tanpa model berarti kita langsung memproses struktur data dasarnya menggunakan bahasa pemrograman yang digunakan.

Keunggulan dari Pendekatan Tanpa Model:

Fleksibilitas: Memudahkan penanganan data yang memiliki struktur yang tidak tetap atau sering berubah.
Pengembangan Cepat: Mengurangi kebutuhan perancangan dan implementasi model sebelumnya.
Simplicity: Cocok untuk skenario sederhana di mana struktur data tidak terlalu kompleks atau tidak memerlukan validasi khusus.
Keunggulan dari Penggunaan Model:

Validasi Data: Model membantu dalam memvalidasi data dan memastikan kesesuaian data yang diterima dengan yang diharapkan.
Konsistensi: Mempermudah pemeliharaan kode, khususnya dalam proyek besar, karena semua interaksi data mengikuti struktur yang telah ditetapkan.
Pemeliharaan Kode: Mempermudah pemeliharaan dan perubahan kode di masa mendatang karena perubahan pada struktur data hanya perlu dilakukan di satu tempat (model).
Dokumentasi: Model berperan sebagai bentuk dokumentasi, memudahkan pengembang lain untuk memahami struktur data.
Lebih disarankan untuk membangun model terlebih dahulu sehingga data JSON yang akan diolah sudah sesuai dengan sintaks pemrograman yang benar.
<br>



## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Fungsi utama dari `CookieRequest` adalah mengelola cookie pada saat melakukan permintaan HTTP. Ini mencakup pengiriman cookie saat permintaan HTTP dikirimkan ke server serta penyimpanan cookie yang diterima dari server. Keberadaan ini krusial untuk memastikan konsistensi sesi pengguna dalam konteks penggunaan aplikasi, seperti saat proses autentikasi atau ketika menyesuaikan preferensi pengguna yang telah disimpan.

Penggunaan instance `CookieRequest` secara universal ke semua komponen dalam aplikasi Flutter memiliki kepentingan besar karena memastikan manajemen cookie dilakukan secara seragam di seluruh aplikasi. Dengan pendekatan ini, setiap permintaan yang dilakukan dari berbagai bagian aplikasi akan mengakses informasi cookie yang sama, memastikan bahwa pengguna tetap terautentikasi dan preferensi mereka tetap konsisten di seluruh aplikasi. Selain itu, pendekatan ini juga membantu menyederhanakan arsitektur kode dengan mengkonsolidasikan logika manajemen cookie, mengurangi duplikasi kode dan potensi kesalahan yang mungkin terjadi.


## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. GET Request dikirimkan ke url supaya kita mendapatkan JSON yang berisi list of product.
```   var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
```

2. Mengubah http respons body agar sesuai dengan bentuk JSON
```
var data = jsonDecode(utf8.decode(response.bodyBytes)); 
```
3. Dari data JSON tersebut, objek product dibuat dan disimpan pada list_product.
```
List<Product> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Product.fromJson(d));
      }
    }
    return list_product;
```
4. Seluruh item yang sudah ada ditampilkan dengan ListView.builder() dan masing-masingnya ditampilkan dalam bentuk Card. Jika card suatu product diklik, maka akan pergi ke halaman details
```
 return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var barang = snapshot.data![index].fields; // Assuming fields has the necessary properties
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailItemPage(fields: barang),
                        ),
                      );
                    },
```

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Membangun objek request dengan CookieRequest lalu meminta input username dan password.
```
    final request = context.watch<CookieRequest>();
```
```
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
```
```
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
```
2. Melakukan login request supaya bisa  mengirim data username dan password ke url tujuan.
```
                final response =
                    await request.login("http://127.0.0.1:8000/auth/login/", {
                  'username': username,
                  'password': password,
                });
```
3. App akan memberikan respons sesuai login request. Kalau berhasil, maka user akan menuju halaman MyHomePage(). Sedangkan, kalau gagal akan muncul AlertDialog().

```
               if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  // ignore: use_build_context_synchronously
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
```
## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
1. `LeftDrawer`: Suatu komponen kustom (didefinisikan di luar kode yang disediakan) yang mungkin dipakai untuk menampilkan drawer navigasi di sisi kiri.
2. `FutureBuilder`: Sebuah widget yang digunakan untuk membangun widget berdasarkan hasil terkini dari Future, seperti menampilkan data yang diperoleh dari internet.
3. `Center`: Widget yang memposisikan child widgetnya tepat di tengah-tengah dari parent widget.
4. `CircularProgressIndicator`: Widget yang menampilkan indikator loading berupa lingkaran yang berputar.
5. `ListView.builder`: Widget yang digunakan untuk membuat daftar yang bisa di-scroll, dimana item-itemnya dibangun secara dinamis.
6. `SizedBox`: Widget yang memberikan ruang atau jarak antara widget lain.
7. `ElevatedButton`: Widget yang menampilkan tombol dengan tampilan menonjol, sering digunakan untuk aksi utama dalam sebuah form.
8. `Navigator`: Digunakan untuk melakukan navigasi antar halaman dalam aplikasi.
9. `AlertDialog`: Widget yang menampilkan dialog untuk memberikan informasi atau konfirmasi kepada pengguna.
10. `TextButton`: Widget yang menampilkan tombol berupa teks, umumnya digunakan dalam dialog.
11. `Provider`: Paket yang digunakan untuk mengelola state dan akses data melintasi berbagai widget.
12. `CookieRequest` (dari `pbp_django_auth`): Komponen yang digunakan untuk mengatur autentikasi serta permintaan HTTP dengan menggunakan cookie, terutama dalam konteks proses login.

Selebihnya sama seperti  minggu lalu.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Pembuatan aplikasi baru dalam proyek Django yang dinamai authentication.
2. Pemasangan library corsheaders dan konfigurasinya pada pengaturan di proyek Django.
3. Penyusunan metode untuk proses login di dalam views.py pada aplikasi authentication.
4. Pembuatan metode untuk proses logout di dalam views.py pada aplikasi authentication.
5. Pembuatan metode create_product_flutter di dalam views.py pada aplikasi utama.
6. Pengaturan path untuk semua metode yang baru dibuat.
7. Instalasi semua paket baru yang diperlukan untuk tugas minggu ini, seperti provider, pbp_django_auth, dan http.
8. Pembuatan login.dart dan penyesuaian main.dart agar masuk pertama kali ke LoginPage().
9. Pembuatan product.dart sebagai model.
10. Pengizinan aplikasi Flutter untuk mengakses internet.
11. Pembuatan list_product.dart dengan pengambilan data dari web yang telah di-deploy.
12. Penyesuaian kembali left drawer.
13. Koneksi form dengan CookieRequest.
14. Penyesuaian kembali pengisian form dengan jsonEncode.
15. Penyesuaian kembali card.dart dengan CookieRequest untuk dapat melakukan logout menggunakan metode yang telah dibangun sebelumnya.
16. Melakukan langkah add-commit-push ke GitHub.



</details>

<details>
<summary> <b> TUGAS 8 </b> </summary>
<br>
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Jawab :
Navigator.push() digunakan untuk melompat ke halaman baru di atas urutan halaman yang ada. Biasanya, ini berguna saat ingin tetap menyimpan jejak perjalanan navigasi, seperti ketika berpindah dari halaman utama ke halaman detail. Misalnya, saat pengguna memilih item dari daftar di halaman utama, kita bisa menggunakan Navigator.push() untuk menampilkan detail dari item tersebut. Setelah selesai, pengguna bisa kembali ke halaman utama dengan menekan tombol kembali.

Navigator.pushReplacement() digunakan untuk menggantikan layar saat ini dengan layar yang baru di urutan navigasi. Ini berguna ketika kita tidak ingin pengguna kembali ke layar sebelumnya, contohnya setelah berhasil proses login. Misalnya, setelah pengguna berhasil masuk pada layar login, kita bisa menggunakan Navigator.pushReplacement() untuk langsung membawa mereka ke halaman utama. Dengan begitu, kita dapat mencegah pengguna untuk kembali ke layar login dengan menekan tombol kembali.


2.Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Jawab :
Column dan Row
Kegunaan: Mengelola widget secara vertikal (Column) dan horizontal (Row). 
Penerapan: Ideal digunakan untuk mengatur tata letak linier seperti formulir atau toolbar.

Stack
Kegunaan: Mengizinkan tumpukan widget satu di atas yang lain. 
Penerapan: Cocok untuk overlay, seperti menempatkan teks di atas gambar.

Container
Kegunaan: Widget serbaguna untuk membungkus, mendekorasi, dan menentukan ukuran.
Penerapan: Berguna saat Anda memerlukan kotak dengan padding, margin, latar belakang, atau perubahan bentuk.

GridView
Kegunaan: Menampilkan widget dalam grid yang dapat di-scroll. 
Penerapan: Cocok digunakan untuk galeri foto atau daftar pilihan produk.

ListView
Kegunaan: Menampilkan daftar item yang bisa di-scroll. 
Penerapan: Berguna untuk daftar email, berita, atau pengaturan.

Flex dan Expanded
Kegunaan: Memberikan fleksibilitas dalam tata letak dengan membagi ruang. 
Penerapan: Berguna saat Anda ingin widget memiliki ukuran relatif terhadap ruang yang tersedia.

3.Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Jawab :
Pada tugas ini saya menggunakan TextField karena hanya perlu input teks, seperti nama produk, jumlah produk, deskripsi, dll.


4.Bagaimana penerapan clean architecture pada aplikasi Flutter?

Jawab : 
Clean Architecture mengatur aplikasi menjadi beberapa lapisan:

Presentation Layer: Menangani UI dan penggunaan Widget. Ini harus memiliki logika tampilan minimal.
Business Logic Layer (BLoC)/State Management: Mengelola state dan logika bisnis aplikasi.
Domain Layer: Berisi aturan bisnis dan entitas.
Data Layer: Mengatur API, penyimpanan lokal, dan repositori yang mengatur data.

Langkah-langkah penerapannya:

Memisahkan kode ke dalam lapisan yang telah disebutkan.
Menggunakan BLoC atau provider untuk manajemen status.
Menerapkan prinsip Dependency Inversion antara lapisan-lapisan yang ada.
Memastikan komunikasi antara lapisan-lapisan tersebut bersih dan terstruktur.


5.Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Jawab :

Pertama, saya membuat sebuah halaman formulir bernama smart_mobile_form.dart yang akan terbuka saat tombol "Tambah Item" ditekan. Di halaman ini, terdapat tiga elemen input yang menggunakan TextFormField dengan nama name, amount, dan description.

Selanjutnya, menambahkan tombol save pada smart_mobile_form.dart yang hanya akan aktif (mengaktifkan aksi) saat semua elemen field terisi.

Setelah itu, menerapkan sebuah pop-up yang akan menampilkan informasi dari input pengguna setelah tombol save berhasil ditekan.

Kemudian, membuat file baru bernama left_drawer.dart yang akan berfungsi sebagai navigasi "Halaman Utama" untuk menuju ke homePage dan "Tambah Item" untuk membuka halaman smart_mobile_form.dart, memungkinkan pengguna untuk menambahkan item.

Setelahnya, untuk bonus: Dalam main.dart, saya membuat sebuah list untuk menyimpan semua model yang sudah dibuat sebagai instansi. Saya juga menyediakan file model.dart untuk membuat model tersebut.

Saya juga membuat berkas lihat_item.dart yang bertujuan untuk menampilkan semua item yang telah dimasukkan oleh pengguna.
</details>

<details>
<summary> <b> TUGAS 7 </b> </summary>
<br>


1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Jawab : 
Dalam pengembangan aplikasi Flutter, perbedaan utama antara stateless widget dan stateful widget terletak pada kemampuan mereka untuk mengelola dan mengubah keadaan (state) dari widget tersebut. Berikut perbedaan utama antara keduanya:

-- Stateless Widget:

Stateless widget adalah widget yang keadaannya tidak dapat berubah (immutable) setelah dibuat.
Stateless widget cocok digunakan untuk bagian aplikasi yang tidak memerlukan perubahan keadaan atau perubahan data yang sering.
Contoh penggunaan stateless widget adalah menampilkan teks statis, ikon, gambar, atau elemen-elemen UI yang tidak memerlukan pembaruan berdasarkan perubahan data.

-- Stateful Widget:

Stateful widget adalah widget yang dapat mengubah keadaannya (mutable) sepanjang waktu.
Stateful widget digunakan ketika Anda perlu memperbarui tampilan atau respons widget berdasarkan perubahan data atau interaksi pengguna.
Stateful widget memiliki metode setState yang memungkinkan Anda memperbarui tampilan widget ketika perubahan keadaan terjadi. Saat Anda memanggil setState, Flutter akan membangkitkan ulang widget untuk mencerminkan perubahan tersebut.
Contoh penggunaan stateful widget meliputi formulir yang memerlukan pengguna untuk memasukkan data, daftar yang dapat diperbarui, atau tampilan yang berubah berdasarkan perubahan data seperti perhitungan.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Jawab :

AppBar: Widget bar yang menampilkan judul aplikasi "SMart - Sita Mart"

SingleChildScrollView: Wrapper widget yang memungkinkan kontennya dapat di-scroll

Padding: Widget yang memberikan margin dari semua sisi

Column: Digunakan untuk menyusun children secara vertikal

Text: Untuk menampilkan teks (PBP Shop) dengan gaya penampilan yang sesuai

Material: Memberikan latar belakang berwarna

InkWell: Membuat area di dalamnya responsif terhadap sentuhan

Container: Widget yang mengelilingi ikon dan teks

Icon: Menampilkan ikon yang sesuai

Text: Widget berisi teks untuk menampilkan teks

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
Jawab :
Membuat program Flutter dengan nama "smart_mobile" dalam direktori kerja "smart_mobile."

Membuat repositori GitHub dengan nama "smart_mobile" dan menjalankan perintah `git init` pada root folder proyek.

Melakukan `git add`, `git commit`, dan `git push` untuk mengunggah proyek Flutter sementara ke GitHub.

Merapihkan struktur proyek dengan membuat file "menu.dart."

Mengubah warna dan sifat widget pada halaman menu menjadi stateless.

Membuat card untuk tombol "Lihat Item," "Tambah Item," dan "Logout."

Membuat widget "build" dan mengatur agar snackbar muncul saat ketiga tombol sebelumnya ditekan dengan menggunakan `ScaffoldMessenger.of(context)`, hingga pesan teks muncul saat tombol ditekan.

Membuat file README yang berisi jawaban untuk pertanyaan.

Menjalankan perintah `git add`, `git commit`, dan `git push` untuk mengunggah perubahan ke GitHub.
</details>



A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



