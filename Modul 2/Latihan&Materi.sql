-- Nama :Irfan Sandi
-- nim  :24241019
-- kelas: A
-- Modul: 2

-- Menggunakan database
USE Pti_mart;

-- mengambil 1 kolom dari 1 tabel
-- Mengambil kolom nama produk dari tabel produk
SELECT nama_produk FROM produk;

-- mengambil 1 kolom dari 1 tabel
-- mengambil kolom nama_produk dan harga dari produk
SELECT nama_produk, harga FROM produk;

-- Mengambil semua kolom
SELECT * FROM produk;

-- memngambil 2 kolom dalam 1 table
SElECT kode_produk,nama_produk FROM produk;

-- mengambil semua kolom 
select * FROM tr_penjualan;


-- PRFIX dan ALIAS
-- PREFIX
-- Bagian nama objek database yang levelnya lebih tinggi
SELECT produk.nama_produk FROM produk;

-- Full hirarki nama_db.nama_table.nama_colum
SELECT pti_mart.produk.nama_produk FROM produk;

-- mengambil 2 kolom yang sama dalam 2 tabel yang berbeda
SELECT produk.harga, tr_penjualan.harga FROM produk,tr_penjualan;

-- ALIAS 
-- nama pengganti sementara dari nama objek database
-- mengganti sementara nama tabel nama_produk dengan 'np'
SELECT nama_produk as np FROM produk;

-- mengganti nama tabel sementara
SELECT nama_produk FROM produk as tp;

-- menggunakan ALIAS dan PREFIX bersamaan
SELECT tp.nama_produk as np FROM produk as tp;