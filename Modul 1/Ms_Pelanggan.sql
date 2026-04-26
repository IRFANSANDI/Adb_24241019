-- NAMA : Irfan Sandi
-- NIM : 24241019
-- Kelas : A

USE pti_mart;

-- Nonaktifkan safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Reset tabel
DROP TABLE IF EXISTS pelanggan;

-- Buat tabel baru
CREATE TABLE pelanggan (
    kode_pelanggan VARCHAR(20) PRIMARY KEY,
    no_urut INT NOT NULL,
    nama_pelanggan VARCHAR(30),
    alamat VARCHAR(50)
);

-- Insert SEMUA data sekaligus
INSERT INTO pelanggan (kode_pelanggan, no_urut, nama_pelanggan, alamat) VALUES
('dqlabcust00', 0, 'Pelanggan Non Member', ''),
('dqlabcust01', 1, 'Eva Novianti, S.H.', 'Vila Sempilan, No. 67 - Kota B'),
('dqlabcust02', 2, 'Heidi Goh', 'Vila Sempilan, No. 11 - Kota B'),
('dqlabcust03', 3, 'Unang Handoko', 'Vila Sempilan, No. 1 - Kota B'),
('dqlabcust04', 4, 'Jokolono Sukarman', 'Vila Permata Intan Berkilau, Blok C5-7'),
('dqlabcust05', 5, 'Tommy Sinaga', 'Vila Permata Intan Berkilau, Blok A1/2'),
('dqlabcust06', 6, 'Irwan Setianto', 'Vila Gunung Seribu, Blok O1 - No. 1 - Kota C'),
('dqlabcust07', 7, 'Agus Cahyono', 'Vila Gunung Seribu, Blok F4 - No. 8'),
('dqlabcust08', 8, 'Maria Sirait', 'Vila Bukit Sagitarius, Gang. Sawit No. 3'),
('dqlabcust09', 9, 'Ir. Ita Nugraha', 'Vila Bukit Sagitarius, Gang Kelapa No. 6'),
('dqlabcust10', 10, 'Djoko Wardoyo, Drs.', 'Vila Bukit Sagitarius, Blok A1 No. 1');

-- Cek hasil
SELECT * FROM pelanggan ORDER BY no_urut;
SELECT COUNT(*) as total_pelanggan FROM pelanggan;

-- Aktifkan kembali safe mode (opsional)
SET SQL_SAFE_UPDATES = 1;