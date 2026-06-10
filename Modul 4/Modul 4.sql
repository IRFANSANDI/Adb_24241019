-- Nama : Irfan Sandi
-- NIM  : 24241019
-- Kelas : A
-- Modul : 4

-- menggunakan database
USE pti_mart;

-- ORDER BY, ASC/DESC, GROUP BY, HAVING
-- ORDER BY, menyusun urutan data sesuai nilai dari kolom

-- Praktek #1
-- Ambil nama_produk, qty dari tabel penjualan urut berdasarkan qty
SELECT nama_produk, qty 
FROM penjualan 
ORDER BY qty;

-- Praktek #2
-- Ambil nama_produk, qty dari tabel penjualan urut berdasarkan qty dan nama_produk
SELECT nama_produk, qty 
FROM penjualan 
ORDER BY qty, nama_produk;

-- Latihan Mandiri

-- 1. Menampilkan semua kolom dari tabel penjualan_dqlab
-- dengan pengurutan berdasarkan qty dan tgl_transaksi
SELECT *
FROM penjualan_dqlab
ORDER BY qty, tgl_transaksi;

-- 2. Menampilkan semua kolom dari tabel ms_pelanggan
-- dengan pengurutan berdasarkan nama_pelanggan
SELECT *
FROM ms_pelanggan
ORDER BY nama_pelanggan;

-- 3. Menampilkan semua kolom dari tabel ms_pelanggan
-- dengan pengurutan berdasarkan alamat
SELECT *
FROM ms_pelanggan
ORDER BY alamat;

-- ASC dan DESC pada ORDER BY

-- Praktek #3
-- Ambil nama_produk dan qty dari penjualan urut qty terbesar ke kecil
SELECT nama_produk, qty 
FROM penjualan 
ORDER BY qty DESC;

-- Praktek #4
-- Ambil nama_produk dan qty dari penjualan urut qty dan nama_produk terbesar ke kecil
SELECT nama_produk, qty 
FROM penjualan 
ORDER BY qty DESC, nama_produk DESC;

-- Latihan Mandiri

-- 1. Menampilkan semua kolom dari tabel penjualan_dqlab
-- diurutkan berdasarkan tgl_transaksi secara descending dan qty secara ascending
SELECT *
FROM penjualan_dqlab
ORDER BY tgl_transaksi DESC, qty ASC;

-- 2. Menampilkan semua kolom dari tabel ms_pelanggan
-- diurutkan berdasarkan nama_pelanggan secara descending
SELECT *
FROM ms_pelanggan
ORDER BY nama_pelanggan DESC;

-- 3. Menampilkan semua kolom dari tabel ms_pelanggan
-- diurutkan berdasarkan alamat secara descending
SELECT *
FROM ms_pelanggan
ORDER BY alamat DESC;

-- ORDER BY dari hasil perhitungan

-- Praktek #5
-- Ambil nama_produk, qty, harga, dan total, urut berdasarkan total terbesar
SELECT nama_produk, qty, harga, qty * harga AS total
FROM penjualan
ORDER BY total DESC;

-- Latihan Mandiri

-- Mengurutkan data berdasarkan total harga
-- dengan rumus jumlah barang × harga barang − diskon
SELECT *,
       (qty * harga - diskon) AS total_harga
FROM penjualan_dqlab
ORDER BY total_harga DESC;

-- WHERE dengan ORDER BY
-- mengurutkan hasil filter data menggunakan WHERE dan ORDER BY

-- Praktek #6
-- Ambil semua nama_produk dan qty yang huruf depan 'F' urut qty
SELECT nama_produk, qty 
FROM penjualan
WHERE nama_produk LIKE 'F%' 
ORDER BY qty DESC;

-- Latihan Mandiri

-- 1. Menampilkan semua kolom dari transaksi penjualan
-- yang memiliki diskon dan diurutkan berdasarkan harga tertinggi
SELECT *
FROM penjualan_dqlab
WHERE diskon > 0
ORDER BY harga DESC;

-- 2. Menampilkan nama produk, kuantitas pembelian, dan harga
-- dengan harga minimal 100000 dan diurutkan berdasarkan harga tertinggi
SELECT nama_produk, qty, harga
FROM penjualan_dqlab
WHERE harga >= 100000
ORDER BY harga DESC;

-- 3. Menampilkan nama produk, kuantitas pembelian, harga, dan diskon
-- dengan harga minimal 100000 atau nama produk berawalan 'T'
-- lalu diurutkan berdasarkan diskon tertinggi
SELECT nama_produk, qty, harga, diskon
FROM penjualan_dqlab
WHERE harga >= 100000
   OR nama_produk LIKE 'T%'
ORDER BY diskon DESC;

-- Fungsi Agregasi
-- fungsi untuk mengolah beberapa row data menghasilkan nilai baru
-- seperti SUM, AVG, MAX, MIN, dan COUNT

-- Praktek #7
-- Jumlahkan qty dari semua transaksi penjualan
SELECT SUM(qty) 
FROM penjualan;

-- Praktek #8
-- Berapa rata-rata qty dari semua transaksi penjualan
SELECT AVG(qty) 
FROM penjualan;

-- Praktek #9
-- Berapa jumlah transaksi
SELECT COUNT(no_urut) 
FROM penjualan;

-- Praktek #10
-- Berapa pelanggan unik yang bertransaksi
SELECT COUNT(DISTINCT kode_pelanggan) 
FROM penjualan;

-- Praktek #11
-- Qty max dan min dari transaksi penjualan
SELECT MAX(qty), MIN(qty) 
FROM penjualan;

-- Praktek #12
-- Tampilkan jumlah seluruh baris pelanggan dan pelanggan unik
SELECT COUNT(*), COUNT(DISTINCT kode_pelanggan)
FROM penjualan;

-- Praktek #13
-- Penggunaan kolom lain dengan agregasi
SELECT nama_produk, MAX(qty)
FROM penjualan;

-- GROUP BY
-- mengelompokkan data berdasarkan satu kolom yang dipilih

-- Praktek #14
SELECT nama_produk 
FROM penjualan;

SELECT nama_produk 
FROM penjualan 
GROUP BY nama_produk;

-- beda dengan agregasi COUNT DISTINCT
SELECT COUNT(DISTINCT nama_produk) 
FROM penjualan;

-- dua kolom atau lebih

-- Praktek #15
SELECT nama_produk, qty 
FROM penjualan
GROUP BY nama_produk, qty;

-- Praktek #16
-- GROUP BY dengan agregasi
-- ambil jumlah qty berdasarkan kelompok nama_produk
SELECT nama_produk, SUM(qty)
FROM penjualan
GROUP BY nama_produk;

-- Praktek #17
-- GROUP BY + Agregasi + ORDER BY
-- ambil jumlah qty berdasarkan kelompok nama_produk
-- lalu urut qty terbesar
SELECT nama_produk, SUM(qty)
FROM penjualan
GROUP BY nama_produk
ORDER BY SUM(qty) DESC;

-- Praktek #18
-- HAVING
-- filter khusus untuk hasil GROUP BY dan fungsi agregasi

-- ambil jumlah qty berdasarkan kelompok nama_produk
-- yang jumlah qty < 6
-- lalu urut qty terbesar
SELECT nama_produk, SUM(qty)
FROM penjualan
GROUP BY nama_produk
HAVING SUM(qty) < 6
ORDER BY SUM(qty) DESC;

-- Latihan Mandiri

-- 1. Menampilkan nama produk dengan total jumlah produk terjual di atas 4
SELECT nama_produk, SUM(qty) AS total_terjual
FROM penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) > 4;

-- 2. Menampilkan nama produk dengan total jumlah produk terjual sama dengan 9
SELECT nama_produk, SUM(qty) AS total_terjual
FROM penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) = 9;

-- 3. Menampilkan kelompok nama produk dan total nilai penjualan
-- (harga × jumlah dikurangi diskon)
-- diurutkan berdasarkan nilai penjualan terbesar
SELECT nama_produk,
       SUM((harga * qty) - diskon) AS total_penjualan
FROM penjualan_dqlab
GROUP BY nama_produk
ORDER BY total_penjualan DESC;