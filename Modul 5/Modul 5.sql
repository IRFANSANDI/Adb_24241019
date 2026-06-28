-- Nama: Irfan Sandi
-- Nim: 24241019
-- Kelas: IVA
-- Modul: 5

-- menggunakan database
USE pti_mart;

-- JOIN
-- Fungsinya menggabungkan dua buah atau lebih tabel
-- praktek1
-- Ambil pembelian dari setiap pelanggan
-- Nama pelanggan, tgl_transaksinya, nama produk, qty
SELECT pl.nama_pelanggan, trp.tgl_transaksi, trp.nama_produk, trp.qty
FROM pelanggan AS pl JOIN tr_penjualan As trp
ON pl.kode_pelanggan = trp.kode_pelanggan;

-- paktek2
-- Join tanpa relational keys
SELECT pl.nama_pelanggan, trp.tgl_transaksi, trp.nama_produk, trp.qty
FROM pelanggan AS pl JOIN tr_penjualan As trp
ON true;

-- praktek3
-- Penggunaan INNER JOIN
SELECT pl.nama_pelanggan, trp.tgl_transaksi, trp.nama_produk, trp.qty
FROM pelanggan AS pl INNER JOIN tr_penjualan As trp
ON pl.kode_pelanggan = trp.kode_pelanggan;

-- praktek4
-- LEFT OUTER JOIN
-- Ambil semua nama pelanggan yang pernah belanja dan tidak pernah
-- Keb kolom : kode_pelanggan nama_pelanggan,qty
SELECT trpkode_pelanggan, plnama_pelanggan, qty
FROM pelanggan AS pl LEFT JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan ORDER BY trp.qty DESC;

-- praktek5
-- RIGH OUTER JOIN
-- Ambil semua pelanggan  yang tidak pernah belanja
-- keb : kode_pelanggan nama_pelanggan qty
SELECT trp.kode_pelanggan, pl.nama_pelanggan, trp.qty
FROM tr_penjualan AS trp RIGHT OUTER JOIN pelanggan AS pl
ON trp.kode_pelanggan = pl.kode_pelanggan
WHERE trp.kode_pelanggan is NULL;

-- praktek6
-- LEFT JOIN 3 Tabel
-- Cari tahu apa saja produk yang dibeli pelanggan
-- keb kolom: kode pelanggan, nama pelanggan, kategori produk, nama produk, qty
SELECT trp.kode_pelanggan, pl.nama_pelanggan, kategori_produk, trp.nama_produk, trp.qty
FROM Pelanggan As pl LEFT OUTER JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan
LEFT OUTER JOIN produk As pr ON pr.kode_produk = kode_produkp;
WHERE trp.kode_pelanggan IS NOT NULL ORDER BY kode_pelanggan;

-- praktek7
-- LEFT JOIN 3 Tabel
-- Cari tahu apa saja produk yang dibeli pelanggan oleh pelanggan urut qty tertinggi
-- keb kolom: kode pelanggan, nama pelanggan, kategori produk, nama produk, qty
SELECT trp.kode_pelanggan, pl.nama_pelanggan, kategori_produk, trp.nama_produk, trp.qty
FROM Pelanggan As pl LEFT OUTER JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan
LEFT OUTER JOIN produk As pr ON pr.kode_produk = trp.kode_produkp;
WHERE trp.kode_pelanggan IS NOT NULL ORDER BY trp.qty DESC;

-- praktek8
-- GROUPING dan Fungsi Agregitasi 
-- Cari tahu berapa banyak total produk yang terjual dikelompokan berdasarkan kategori
-- keb kolom: kategori produk, nama produk, qty
SELECT pr.kategori_produk, trp.nama_produk, SUM(qty) AS qty
FROM tr_penjualan AS trp LEFT OUTER JOIN produk AS pr
ON trp.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk, trp.nama_produk
ORDER BY SUM(qty) DESC; 

-- Latihan Mandiiri
-- 1. SELECT *
FROM tr_penjualan tp
INNER JOIN ms_pelanggan mp
    ON tp.kode_pelanggan = mp.kode_pelanggan
INNER JOIN ms_produk pr
    ON tp.kode_produk = pr.kode_produk;
    
-- 2. SELECT *
FROM ms_pelanggan mp
LEFT JOIN tr_penjualan tp
    ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk pr
    ON tp.kode_produk = pr.kode_produk
WHERE tp.qty IS NOT NULL;

-- 3. SELECT
    pr.kategori_produk,
    SUM(tp.qty) AS total_qty
FROM ms_pelanggan mp
INNER JOIN tr_penjualan tp
    ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk pr
    ON tp.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk;

-- 4. SELECT
    p1.kode_produk,
    p1.nama_produk,
    p2.kode_produk AS kode_produk_relasi,
    p2.nama_produk AS nama_produk_relasi
FROM ms_produk p1
INNER JOIN ms_produk p2
    ON p1.kode_produk = p2.relationship;

