# Identifikasi Tren Cyclistic
Proyek ini merupakan proyek akhir dari program sertifikasi Data Analytics yang diadakan oleh Coursera. Proyek ini akan mengolah data sebuah perusahaan fiktif, Cyclistic. Cyclistic merupakan sebuah perusahaan berbagi sepeda di Chicago. Proyek ini akan merancang strategi pemasaran yang bertujuan untuk mengubah pengendara kasual menjadi anggota tahunan.

**Tujuan**

* Untuk lebih memahami bagaimana anggota tahunan dan pengendara kasual berbeda
* Untuk mengetahui mengapa pengendara kasual membeli keanggotaan
* Untuk mengetahui bagaimana media digital dapat memengaruhi taktik pemasaran
* Dan menganalisis data perjalanan sepeda Cyclistic historis untuk mengidentifikasi tren

**Tiga pertanyaan akan memandu program pemasaran di masa mendatang:**
1. Bagaimana anggota tahunan dan pengendara kasual menggunakan sepeda Cyclistic secara 
berbeda? 
2. Mengapa pengendara kasual membeli keanggotaan tahunan Cyclistic? 
3. Bagaimana Cyclistic dapat menggunakan media digital untuk memengaruhi pengendara 
kasual agar menjadi anggota?

**Data yang digunakan**

Merupakan data perjalanan historis Cyclistic untuk menganalisis dan mengidentifikasi tren, yang merupakan data publik. Dataset yang digunakan, yaitu [Divvy 2019 Q1](https://docs.google.com/spreadsheets/d/1uCTsHlZLm4L7-ueaSLwDg0ut3BP_V4mKDo2IMpaXrk4/template/preview?resourcekey=0-dQAUjAu2UUCsLEQQt20PDA#gid=1797029090) dan [Divvy 2020 Q1](https://docs.google.com/spreadsheets/d/179QVLO_yu5BJEKFVZShsKag74ZaUYIF6FevLYzs3hRc/template/preview#gid=640449855).

**1. Pembersihan dan Manipulasi Data menggunakan spreadsheet**

Adapun langkah-langkah yang dilakukan:
1. Membuka spreadsheet dan membuat kolom bernama ride_length.
2. Menghitung durasi setiap perjalanan dengan mengurangi kolom start_time dari kolom end_time (misalnya, =C2-B2)
3. Memformat sebagai HH:MM:SS menggunakan Format > Cels > Time > 37:30:55. 
4. Membuat kolom bernama day_of_week, dan menghitung hari dalam seminggu saat setiap perjalanan dimulai menggunakan perintah WEEKDAY (misalnya, =WEEKDAY(C2,1)) di setiap file.
5. Memformat sebagai General atau sebagai angka tanpa desimal, bahwa 1 = Minggu dan 7 = Sabtu. 

Langkah-langkah memeriksa dan menangani data kosong:
1. Gunkan filter untuk memfilter data
2. Kemudian memeriksa apakah terdapat data "Blank"
3. Pada data [Divvy 2020 Q1](https://docs.google.com/spreadsheets/d/179QVLO_yu5BJEKFVZShsKag74ZaUYIF6FevLYzs3hRc/template/preview#gid=640449855), terdapat satu baris dengan beberepa nilai variabel yang kosong, yaitu pada kolom end_station_name, end_station_id, end_lat, dan end_lng. Setelah diperiksa nilai pada variabel started_at dan variabel ended_at pada baris tersebut menunjukkan waktu yang sama, yang berarti sepeda tidak jadi digunakan. Maka variabel-variabel yang kosong tersebut diisi dengan nilai yang terdapat pada variabel start_station_name, start_station_id, start_lat, dan start_lng.
4. Pada data [Divvy 2020 Q1](https://docs.google.com/spreadsheets/d/179QVLO_yu5BJEKFVZShsKag74ZaUYIF6FevLYzs3hRc/template/preview#gid=640449855) juga, pada variabel ride_lenght terdapat beberapa baris nilai yang tidak terdefinisi. Setelah diperiksa, pada variabel started_at dan variabel ended_at menunjukkan kesalahan dimana waktu dari variabel started_at lebih besar dibandingkan ended_at (misalnya, started_at 3/18/2020  12:24:00 PM sementara variabel ended_at 3/18/2020  12:23:00 PM). Langkah yang dilakukan terkait ini adalah menghapus data-data yang salah tersebut. Terdapat 25 baris data yang dihapus.
5. Pada data [Divvy 2019 Q1](https://docs.google.com/spreadsheets/d/1uCTsHlZLm4L7-ueaSLwDg0ut3BP_V4mKDo2IMpaXrk4/template/preview?resourcekey=0-dQAUjAu2UUCsLEQQt20PDA#gid=1797029090), pada kolom gender dan birtyear terdapat beberapa baris data yang kosong. Untuk kasus ini data yang kosong akan dibiarkan, karena pada analysis data yang akan dilakukan tidak akan digunakan variabel gender dan tahun lahir pengguna.

Langkah-langkah mengurutkan data:
1. Gunakan fungsi short untuk mengurutkan data
2. Data diurutkan berdasarkan variabel tanggal start, dari tanggal terlama ke terbaru.

Langkah-langkah melakukan analisis deskriptif:
1. Jalankan beberapa perhitungan dalam satu file: 
* Menghitung rata-rata ride_length 
* Menghitung ride_length maksimum 
* Menghitung modus day_of_week
2. Membuat tabel pivot untuk menghitung dan memvisualisasikan data dengan cepat: 
* Menghitung rata-rata ride_length untuk anggota dan pengendara kasual. Tentukan rows = member_casual, Values = Average of ride_length. 
* Menghitung rata-rata ride_length untuk pengguna berdasarkan day_of_week. Tentukan  columns = day_of_week, Rows = member_casual, Values = Average of ride_length.
* Menghitung jumlah perjalanan untuk pengguna berdasarkan day_of_week dengan menambahkan Count dari trip_id ke Values.


# Perbedaan antara Anggota Tahunan dan Pengendara Kasual
Analisis menunjukkan perbedaan perilaku yang sangat kontras antara kedua kelompok:

**Durasi Perjalanan:** Pengendara kasual memiliki rata-rata durasi perjalanan yang jauh lebih lama baik di tahun 2019 maupun 2020, yaitu sekitar 61,94 dan 95,83 menit, dibandingkan dengan anggota (member) yang hanya rata-rata 13,89 dan 12,67 menit. Hal ini menunjukkan pengendara kasual cenderung menggunakan sepeda untuk rekreasi, sementara anggota menggunakannya untuk transportasi efisien (commuting).

**Pola Mingguan:** Anggota memiliki jumlah perjalanan yang tinggi secara konsisten pada hari kerja (Senin-Jumat), sedangkan pengendara kasual menunjukkan peningkatan aktivitas yang signifikan pada akhir pekan (Hari 1/Minggu dan Hari 7/Sabtu).

# Mengapa Pengendara Kasual Membeli Keanggotaan?
Data mengidentifikasi beberapa faktor pendorong potensial:

**Frekuensi Penggunaan:** Pengendara kasual yang mulai menggunakan sepeda pada hari kerja mungkin melihat keanggotaan sebagai cara yang lebih hemat untuk transportasi rutin.

**Efisiensi Biaya pada Durasi Panjang:** Karena pengendara kasual memiliki durasi perjalanan yang sangat lama, mereka dapat dikonversi dengan menawarkan skema keanggotaan yang memberikan keuntungan untuk perjalanan durasi panjang atau frekuensi tinggi di akhir pekan.

# Pengaruh Media Digital terhadap Taktik Pemasaran
Media digital dapat digunakan untuk menargetkan segmen kasual berdasarkan temuan data:

**Targeting Akhir Pekan:** Kampanye iklan digital dapat dioptimalkan pada hari Jumat dan akhir pekan, saat volume pengendara kasual berada pada puncaknya.

**Pesan "Rekreasi ke Komuter":** Menggunakan media sosial untuk membagikan konten tentang kemudahan menggunakan Cyclistic untuk bekerja, menargetkan mereka yang saat ini hanya menggunakannya untuk durasi lama di akhir pekan.

# Tren Sejarah Cyclistic (Q1 2019 vs Q1 2020)
**Pertumbuhan Pengguna:** Terdapat tren peningkatan jumlah perjalanan dari tahun 2019 ke 2020, terutama pada segmen pengguna kasual yang meningkat pesat.

**Konsistensi Jam Sibuk:** Jam sibuk tetap stabil pada waktu keberangkatan dan kepulangan kantor, yang menegaskan peran Cyclistic sebagai tulang punggung transportasi di kota tersebut.

# Rekomendasi Strategis:

Berdasarkan analisis mendalam terhadap data perjalanan Cyclistic Q1 2019 dan Q1 2020, berikut dijabarkan tiga rekomendasi utama untuk mendorong konversi pengendara casual menjadi anggota tahunan. Rekomendasi ini memfokuskan pemasaran pada konversi pengendara kasual akhir pekan dengan menonjolkan penghematan biaya untuk durasi perjalanan panjang melalui keanggotaan tahunan.

1. Kampanye "Weekend Warrior" yang Tersegmentasi
Analisis menunjukkan bahwa pengendara casual mendominasi penggunaan pada akhir pekan dengan durasi perjalanan yang cukup lama.

**Strategi:** Luncurkan promosi digital khusus yang menargetkan pengguna yang sering berkendara pada hari Sabtu dan Minggu.

**Pesan Utama:** Tawarkan keanggotaan tahunan dengan narasi penghematan biaya untuk durasi perjalanan panjang, sehingga pengendara casual merasa keanggotaan lebih menguntungkan daripada membayar biaya per perjalanan di setiap akhir pekan.

2. Paket Transisi
Meskipun pengguna casual cenderung rekreasi, terdapat volume perjalanan yang cukup konsisten pada jam sibuk pagi (08:00) dan sore (17:00).

**Strategi:** Berikan penawaran terbatas bagi pengguna casual yang terdeteksi melakukan perjalanan pada hari kerja (Senin-Jumat) selama jam sibuk.

**Pesan Utama:** Tekankan kenyamanan dan efisiensi Cyclistic sebagai alat transportasi rutin ke kantor dengan biaya bulanan yang lebih murah dibandingkan moda transportasi lain.

3. Optimalisasi Pemasaran Digital pada Jam Puncak
Data menunjukkan tren puncak penggunaan yang stabil pada pukul 17:00 sore.

**Strategi:** Tingkatkan visibilitas iklan di media sosial dan aplikasi pada jendela waktu jam pulang kantor (pukul 16:00 - 18:00).

**Pesan Utama:** Gunakan konten visual yang menunjukkan kemudahan akses sepeda Cyclistic saat kemacetan sore hari terjadi, dengan ajakan bertindak (call-to-action) untuk mendaftar menjadi anggota agar proses peminjaman lebih cepat dan murah.
