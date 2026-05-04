--Divvy_Trips_2019_Q1--
--Melihat Jumlah Total Baris (COUNT)--
SELECT COUNT(*) AS total_baris 
FROM `valiant-acumen-475912-u8.Cyclistic.2019`;

--Total baris: 365069--

--Melihat Nilai Unik (DISTINCT)--
--trip_id--
SELECT COUNT(DISTINCT trip_id) AS jumlah_nilai_unik 
FROM `valiant-acumen-475912-u8.Cyclistic.2019`;

--Jumlah nilai unik trip_id: 365069--

--bikeid--
SELECT COUNT(DISTINCT bikeid) AS jumlah_nilai_unik 
FROM `valiant-acumen-475912-u8.Cyclistic.2019`;

--Jumlah nilai unik bikeid: 4769--

--from_station_name--
SELECT COUNT(DISTINCT from_station_name) AS jumlah_nilai_unik 
FROM `valiant-acumen-475912-u8.Cyclistic.2019`;

--Jumlah nilai unik from_statiom_name: 594--

--to_station_name--
SELECT COUNT(DISTINCT to_station_name) AS jumlah_nilai_unik 
FROM `valiant-acumen-475912-u8.Cyclistic.2019`;

--Jumlah nilai unik to_station_name: 600--

--Nilai Maksimum, Minimum, dan Rata-rata--
SELECT 
    MAX(tripduration) AS durasi_perjalanan_maksimum,
    MIN(tripduration) AS durasi_perjalanan_minimum,
    AVG(tripduration) AS rata_rata_durasi_perjalanan
FROM `valiant-acumen-475912-u8.Cyclistic.2019`;

--Menggunakan JOIN (Menyamping)--
SELECT 
    a.from_station_name AS stasiun_2019,
    b.start_station_name AS stasiun_2020,
    a.trip_id,
    b.ride_id
FROM `valiant-acumen-475912-u8.Cyclistic.2019` AS a
INNER JOIN `valiant-acumen-475912-u8.Cyclistic.2020` AS b 
    ON a.from_station_id = b.start_station_id;
	
--Menggunakan UNION ALL (Menumpuk)--
SELECT 
    CAST(trip_id AS STRING) AS id_perjalanan, 
    start_time AS waktu_mulai, 
    from_station_name AS nama_stasiun
FROM `valiant-acumen-475912-u8.Cyclistic.2019`

UNION ALL

SELECT 
    ride_id AS id_perjalanan, 
    started_at AS waktu_mulai, 
    start_station_name AS nama_stasiun
FROM `valiant-acumen-475912-u8.Cyclistic.2020`;

--Menggabungkan data dari kedua tahun, menyelaraskan nama kolom, dan menghitung total perjalanan per jam untuk melihat jam sibuk--
CREATE TABLE Cyclistic.tren_jam AS
SELECT 
    EXTRACT(HOUR FROM waktu_mulai) AS jam,
    COUNT(CASE WHEN tahun = '2019' THEN id_perjalanan END) AS total_2019,
    COUNT(CASE WHEN tahun = '2020' THEN id_perjalanan END) AS total_2020
FROM (
    SELECT 
		CAST(trip_id AS STRING) AS id_perjalanan, 
		CAST(start_time AS DATETIME) AS waktu_mulai, 
		'2019' AS tahun 
    FROM `valiant-acumen-475912-u8.Cyclistic.2019`
    UNION ALL
    SELECT 
		ride_id AS id_perjalanan, 
		CAST(started_at AS DATETIME) AS waktu_mulai, 
		'2020' AS tahun 
    FROM `valiant-acumen-475912-u8.Cyclistic.2020`
) AS data_gabungan
GROUP BY jam
ORDER BY jam;

--Jam Sibuk (Rush Hour): Terdapat dua puncak penggunaan yang sangat jelas, yaitu pada pukul 08:00 pagi dan pukul 17:00 sore--
--Volume perjalanan di tahun 2020 secara umum lebih tinggi di hampir setiap jamnya--


--Ringkasan Tipe Pengguna--
CREATE TABLE Cyclistic.ringkasan_pengguna AS
SELECT 
    tahun,
    tipe_pengguna,
    COUNT(*) AS total_perjalanan
FROM (
    SELECT 
		'2019' AS tahun, 
           CASE WHEN usertype = 'Subscriber' THEN 'member' ELSE 'casual' END AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2019`
    UNION ALL
    SELECT 
		'2020' AS tahun, 
		member_casual AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2020`
) AS data_user
GROUP BY tahun, tipe_pengguna;

--Menghitung durasi perjalanan berdasarkan tipe pengguna--
CREATE TABLE Cyclistic.durasi_tipe_pengguna AS
SELECT 
    tahun,
    tipe_pengguna,
    COUNT(ride_length) AS total_perjalanan
FROM (
    SELECT 
		'2019' AS tahun, 
           CASE WHEN usertype = 'Subscriber' THEN 'member' ELSE 'casual' END AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2019`
    UNION ALL
    SELECT 
		'2020' AS tahun, 
		member_casual AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2020`
) AS data_user
GROUP BY tahun, tipe_pengguna;

--Menghitung rata-rata durasi perjalanan berdasarkan tipe pengguna dalam menit--
CREATE TABLE Cyclistic.mean_durasi_tipe_pengguna AS
SELECT 
    tahun,
    tipe_pengguna,
    AVG(total_menit) AS durasi_perjalanan
FROM (
    SELECT 
		(CAST(SPLIT(ride_length, ':')[OFFSET(0)] AS INT64) * 60) + -- Jam ke Menit
		(CAST(SPLIT(ride_length, ':')[OFFSET(1)] AS INT64)) +      -- Menit
		(CAST(SPLIT(ride_length, ':')[OFFSET(2)] AS INT64) / 60)   -- Detik ke Menit
		AS total_menit,
		'2019' AS tahun, 
        CASE WHEN usertype = 'Subscriber' THEN 'member' ELSE 'casual' END AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2019`
    UNION ALL
    SELECT 
		(CAST(SPLIT(ride_length, ':')[OFFSET(0)] AS INT64) * 60) + -- Jam ke Menit
		(CAST(SPLIT(ride_length, ':')[OFFSET(1)] AS INT64)) +      -- Menit
		(CAST(SPLIT(ride_length, ':')[OFFSET(2)] AS INT64) / 60)   -- Detik ke Menit
		AS total_menit,
		'2020' AS tahun, 
		member_casual AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2020`
) AS data_user
GROUP BY tahun, tipe_pengguna;

--Menghitung total perjalanan per hari--
SELECT 
    tahun,
    day_of_week,
    tipe_pengguna,
    COUNT(*) AS total_perjalanan
FROM (
    -- Menyelaraskan data 2019
    SELECT 
        '2019' AS tahun,
        day_of_week,
        CASE WHEN usertype = 'Subscriber' THEN 'member' ELSE 'casual' END AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2019`
    
    UNION ALL
    
    -- Menyelaraskan data 2020
    SELECT 
        '2020' AS tahun,
        day_of_week,
        member_casual AS tipe_pengguna
    FROM `valiant-acumen-475912-u8.Cyclistic.2020`
)
GROUP BY tahun, day_of_week, tipe_pengguna
ORDER BY tahun, day_of_week;

--Jumlah perjalanan per jam tahun 2019 dan 2020--
SELECT 
    EXTRACT(HOUR FROM waktu_mulai) AS jam,
    COUNT(CASE WHEN tahun = '2019' THEN id_perjalanan END) AS total_perjalanan_2019,
    COUNT(CASE WHEN tahun = '2020' THEN id_perjalanan END) AS total_perjalanan_2020
FROM (
    -- Data 2019
    SELECT 
        CAST(trip_id AS STRING) AS id_perjalanan, 
        CAST(start_time AS DATETIME) AS waktu_mulai, 
        '2019' AS tahun 
    FROM `valiant-acumen-475912-u8.Cyclistic.2019`
    
    UNION ALL
    
    -- Data 2020
    SELECT 
        ride_id AS id_perjalanan, 
        CAST(started_at AS DATETIME) AS waktu_mulai, 
        '2020' AS tahun 
    FROM `valiant-acumen-475912-u8.Cyclistic.2020`
)
GROUP BY jam
ORDER BY jam;