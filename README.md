# SportCircle — Deskripsi Singkat & Rencana Arsitektur

## Deskripsi Nama Aplikasi
SportCircle adalah platform mobile yang menyatukan aktivitas olahraga, pemesanan fasilitas, transaksi, dan komunitas dalam satu ekosistem yang mudah diakses. Aplikasi ini dirancang untuk memudahkan pengguna menemukan, memesan, dan berinteraksi seputar kegiatan kebugaran dan olahraga.

## Filosofi Nama
- Sport: menegaskan fokus aplikasi pada aktivitas fisik, kebugaran, dan layanan terkait olahraga.
- Circle: melambangkan komunitas yang inklusif dan saling terhubung - pengguna menjadi bagian dari sebuah lingkaran sosial yang suportif, bukan sekadar konsumen.

Keseluruhan filosofi menekankan keterhubungan, kontinuitas, dan dukungan komunitas dalam pengalaman olahraga.

## Rencana Arsitektur
Pendekatan utama: Clean Architecture + BLoC untuk state management.

## Warna & Tema
- Primary (Brand): Rausch - #FF385C 
- Neutral palette: shades of white, light gray, and dark text for readability
- Typography: Modern Sans-Serif (Inter atau Plus Jakarta Sans)
- UI tokens: rounded corners (12–16px), soft shadows, generous whitespace

## Teknologi yang Digunakan
- **Flutter**: Framework utama untuk pengembangan aplikasi mobile cross-platform.
- **BLoC**: State management (flutter_bloc, bloc_concurrency, stream_transform).
- **Clean Architecture**: Struktur kode modular dan scalable.
- **GoRouter**: Navigasi antar halaman.
- **Dio & Retrofit**: Networking dan integrasi API.
- **Google Fonts, Flutter SVG, Carousel Slider, Cached Network Image**: UI/UX enhancement.
- **Shared Preferences, Flutter Secure Storage**: Penyimpanan data lokal dan keamanan.
- **Freezed, Injectable, Json Serializable**: Code generation dan dependency injection.
- **Firebase** (opsional): Autentikasi dan database (dapat diaktifkan sesuai kebutuhan).
- **Rive**: Animasi interaktif.

## Fitur Utama
- Registrasi & Login pengguna
- Manajemen komunitas olahraga
- Pemesanan fasilitas olahraga
- Forum diskusi & event management
- Transaksi dan riwayat aktivitas
- Profil pengguna

## Struktur Proyek
- `lib/core`: Konstanta, data, DI, error, network, storage, themes, usecases, utils
- `lib/features`: Modul fitur (activity, authentication, category, home, like, location, main, profile, splash, transaction)
- `assets/`: Logo dan aset gambar
- `test/`: Unit test dan widget test

## Cara Menjalankan
1. Pastikan sudah install Flutter SDK (versi sesuai `pubspec.yaml`)
2. Jalankan perintah:
   ```
   flutter pub get
   flutter run
   ```
3. Untuk build release:
   ```
   flutter build apk
   flutter build ios
   flutter build web
   ```