-- nama : Irfan Sandi
-- nim : 24241019
-- kelas : A
-- modul: 3

-- Nilai Literal, Operator Matematika, Perbandingan,
-- Fungsi Matematika dan Tanggal (Date)
-- Klausal WHERE , LIKE

-- Praktek 1
-- Menggunakan nilai litelar pada SELECT
SELECT 77;

-- Praktik 2
-- Menggunakan SELECT untuk menampilkan nilai tipe data yang berbeda
SELECT 77 as angka, true AS nilai_logika, 'PTI' As teks;


-- NULL
-- berarti tidak memiliki nilai apapun atau kosong
-- Praktek 3
-- Menggunakan SELECT untuk menampilkan NULL
SELECT NULL AS kosong;

-- Operator Matematika
-- Praktek 4
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi_1, 5 DIV 2 AS hasil_bagi_2;

-- Praktek latihan mandiri
SELECT 4*2;
SELECT (4*8)%7;
SELECT (4*8) MOD 7;
-- Praktek 5
-- menggunakan database
USE pti_mart;

-- operator matematika untuk dua kolom dalam tabel penjualan
-- Praktek 6
-- ambil data hasil perkalian kolom qty dan harga simpn dalam kolom total beli
SELECT qty*harga AS total_beli FROM penjualan;


-- Operator perbandingan
-- Praktek 7
SELECT 5=5, 5!=5, 5!=4;
SELECT 1 = true;
SELECT 1 = false;
SELECT 5 >= 5;
SELECT 5.2 = 5.20000;
SELECT NULL = 1;
SELECT NULL = NULL;

-- Fungsi
-- Proses yang memiliki nama, bukan simbol seperti operator
-- Praktek 8
SELECT POW(3,2), ROUND(3.14), ROUND(3.54), ROUND(3.155, 1),
ROUND(3.155,2), FLOOR(4.28), FLOOR(4.78), CEILING(4.39),CEILING (4.55);

-- Praktek 9
SELECT NOW(), YEAR('2022-05-03'),
ROUND (DATEDIFF(NOW(), '2022-05-03')),
DAY('2022-05-03');
-- Latihan Mandiri 
SELECT DATEDIFF('2022-07-23', NOW());
SELECT YEAR('2022-07-23');
SELECT MONTH('2022-07-23');
SELECT DAY('2022-07-23');
SELECT YEAR(NOW());









