# smart_mobile

Nama    : Sita Amira Syarifah
NPM     : 2206023023
Kelas   : PBP B

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
