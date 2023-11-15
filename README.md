# smart_mobile

Nama    : Sita Amira Syarifah
NPM     : 2206023023
Kelas   : PBP B

<details>
<summary>TUGAS 8</summary>
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

## TUGAS 7

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


A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
