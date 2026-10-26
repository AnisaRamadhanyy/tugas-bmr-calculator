# bmi_kalkulator_app

A new Flutter project.

# Kalkulator BMI dan BMR

Aplikasi Flutter yang menggabungkan kalkulator **BMI** (Body Mass Index) dan **BMR** (Basal Metabolic Rate) dalam satu aplikasi. Kalkulator BMR mengacu pada [calculator.net/bmr-calculator](https://www.calculator.net/bmr-calculator.html) dan dikembangkan dari kalkulator BMI.

## Anggota Kelompok

| No | Nama | NIM |
|----|------|-----|
| 1  | Khoirul Lathifah Oktaviani | K3524027 |
| 2  | Annisa Ramadhani | K3524045 |
| 3  | Natasya Luthfia Ramadhani | K3524063 |

## Deskripsi

- **BMI** menilai proporsi berat terhadap tinggi badan dan menampilkan kategori serta rentang berat sehat.
- **BMR** menghitung kalori minimum yang dibutuhkan tubuh saat istirahat total, lalu mengalikannya dengan faktor aktivitas untuk mendapat kebutuhan kalori harian.

### Fitur

- Tampilan mengikuti calculator.net: banner biru, tab satuan, panel form abu-abu, dan panel hasil hijau
- Dua halaman: BMI dan BMR (navigasi bawah), dengan nilai contoh yang langsung dihitung
- Satuan **Metrik** (kg, cm) dan **US** (lb, ft, in)
- BMI: nilai, kategori, rentang BMI dan berat sehat, skala warna, tabel kategori
- BMR: rumus **Mifflin-St Jeor**, **Revised Harris-Benedict**, dan **Katch-McArdle**, hasil dalam kalori atau kilojoule lewat menu Pengaturan
- Kebutuhan kalori harian untuk 6 tingkat aktivitas
- Validasi input (umur 15 - 80), tombol Hitung dan Bersihkan

### Contoh

Umur 25 tahun, pria, tinggi 180 cm, berat 60 kg (rumus Mifflin-St Jeor): **BMR = 1.605 kalori/hari**.

### Rumus

| Perhitungan | Persamaan |
|-------------|-----------|
| BMI | berat (kg) / tinggi (m)^2 |
| Mifflin-St Jeor | Pria: 10W + 6.25H - 5A + 5, Wanita: 10W + 6.25H - 5A - 161 |
| Revised Harris-Benedict | Pria: 13.397W + 4.799H - 5.677A + 88.362, Wanita: 9.247W + 3.098H - 4.330A + 447.593 |
| Katch-McArdle | 370 + 21.6 x LBM |

Keterangan: W = berat (kg), H = tinggi (cm), A = umur (tahun), LBM = berat x (1 - lemak tubuh / 100).
Kebutuhan kalori harian = BMR x faktor aktivitas (1.2 / 1.375 / 1.465 / 1.55 / 1.725 / 1.9).

## Screenshot

| Halaman BMR | Halaman BMI |
|-------------|-------------|
| ![BMR](screenshots/bmr.png) | ![BMI](screenshots/bmi.png) |

## Struktur Kode

| File | Isi |
|------|-----|
| `lib/main.dart` | Titik masuk aplikasi, tema, dan navigasi |
| `lib/bmi_page.dart` | Halaman BMI |
| `lib/bmr_page.dart` | Halaman BMR |
| `lib/common.dart` | Validasi, format angka, dan widget bersama |

## Cara Menjalankan

```bash
git clone <link-repository>
cd <nama-folder-project>
flutter pub get
flutter run
```

## Teknologi

- Flutter (Dart), Material 3

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


